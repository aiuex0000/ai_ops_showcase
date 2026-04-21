# Check Script Evolution

このメモは、`scripts/check-workspace-harness.ps1` のような **一括入口の guardrail** がなぜ必要になったかを、公開向けに噛み砕いて説明するための資料です。

## Before

初期段階では、チェック系の script を用途ごとに個別で呼ぶ運用になりがちです。

- entrypoint だけ見たい時は 1 本
- archive 系だけ見たい時は別の 1 本
- state 素材収集はまた別
- tmp や local settings も別

これ自体は小さいうちは回りますが、運用が育つほど次の問題が出ます。

- 入口が増える
- 何を先に実行すべきか分かりにくい
- archive / tmp / state の確認が抜けやすい
- check を足すたびに「正式入口」が曖昧になる

## After

そこで `check:workspace` を 1 本の正式入口とし、`scripts/check-workspace-harness.ps1` に次の責務を集約します。

- entrypoints の参照整合
- archive harness の存在確認
- current state materials の取得確認
- tmp hygiene の確認
- local settings や runtime surface の sanity check

ポイントは、**全部を 1 script に押し込むこと** ではありません。  
`何を最初に回せば workspace の健康状態が分かるか` だけを 1 本に寄せ、実際の個別 check はその下で分けて持つことです。

## Comparison Table

| 観点 | Before | After |
| --- | --- | --- |
| 実行入口 | 用途ごとに散らばる | `check:workspace` に寄せる |
| 初見の分かりやすさ | 何を先に回すか迷いやすい | まず 1 本走らせればよい |
| 責務の見え方 | entrypoint / archive / state / tmp が分離しすぎる | 一覧性を持ったまま個別 check へ降りられる |
| 漏れやすさ | ある層だけ見て満足しやすい | 主要レイヤーをまとめて確認できる |
| 拡張時の扱い | check を増やすたびに入口候補が増える | 正式入口の下へ 1 step 追加すればよい |

## Representative Before Sketch

これは実際の過去コードではなく、散らばった運用を説明するための擬似例です。

```powershell
# before: checks are scattered
& .\scripts\check-agent-entrypoints.ps1
& .\scripts\check-ai-archive-harness.ps1
& .\scripts\get-current-state-materials.ps1 | Out-Null
& .\scripts\check-tmp-hygiene.ps1

# ...and the next person still has to know this order.
```

問題は、各 script が悪いことではありません。  
**毎回この順番を知っている必要がある** ことが、運用コストになっていました。

## Representative After Sketch

公開向け sample では、代表例を [samples/check_workspace_harness.sample.ps1](./samples/check_workspace_harness.sample.ps1) に置いています。

その sample が見せたいのは、次の構造です。

1. 必須 path を先に確認する
2. `Entrypoint guardrails`
3. `Archive harness`
4. `Current state materials`
5. `Tmp hygiene`

つまり、`個別 check の存在` は残しつつ、`どこから入るか` だけを 1 本へ固定しています。

## What We Learned In Practice

- check が増えること自体より、**正式入口が増えること** のほうが運用を壊しやすい
- `script を足す` と `入口を足す` は別問題として扱ったほうが安定する
- entrypoints / archive / state / tmp は別責務だが、日常点検ではまとめて見たほうが抜けが減る
- 一括入口は monolith 化ではなく、**読む順番の固定** として設計したほうが育てやすい
