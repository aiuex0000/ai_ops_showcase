# Automation Matrix Sample

この sample は、複数の automation を **一覧 + 責務分離 + 禁止事項** で見せるための公開向け再編集版です。  
実物の full matrix をそのまま複製するのではなく、日常運用で重要なレイヤーだけを読みやすく抜いています。

## What This Matrix Covers

対象は、AI 実務運用の中でも次の 4 層です。

- `capture layer`
- `state layer`
- `report layer`
- `sync / guard layer`

ここで大事なのは、`何が動いているか` だけでなく、**その automation が何をしてはいけないか** を一緒に固定することです。

## Automation Layers

### Capture Layer

raw log や会話アーカイブを取りこぼしなく残す層です。  
判断や要約を主目的にせず、後続の state / report が参照できる材料を揃えます。

### State Layer

`Current State` や handoff のように、現在地を短く保つための補助層です。  
blind update を避け、意味のある変化だけを反映します。

### Report Layer

その日の作業や共有向け報告を再圧縮する層です。  
archive や state を参照してよいですが、それ自体を置き換えません。

### Sync / Guard Layer

entrypoint の drift、runtime surface の崩れ、repo sync の安全性を点検する層です。  
成果物生成より、`壊れていないか` の確認を主目的にします。

## Public Matrix Table

| automation name | schedule | writes to | main responsibility | must not do |
| --- | --- | --- | --- | --- |
| `Home AI Log Sync` | logon + every 15 min | `Obsidian/AI/*`, `tmp/automation/*` | raw log capture を継続し、後から読める Markdown archive を揃える | `Current State` や日報本文を直接更新しない |
| `Home Handoff Note` | every morning | Obsidian handoff note | Home / Office 間で朝いちに見るべき要点だけを残す | `Current_State.md` `Recent_Context.md` `Current_Project.md` を blind update しない |
| `Entrypoint Check` | weekday morning | short inbox / check summary | entrypoints と bridge / guardrails の整合を確認する | state や report を書かない |
| `Raw Log Sync` | weekday midday / pre-report | `Obsidian/AI/codex`, `Obsidian/AI/copilot`, `tmp/automation/*` | report 前に Codex / Copilot の raw source を揃える | DailyReport 本文や state stack を自動更新しない |
| `Daily Report` | weekday afternoon | `DailyReport`, `Shared Work Report`, optional state notes | 収集済み材料からその日の report を生成する | `Current Project` に会話温度や私的情報を書かない |
| `Current State Fallback` | paused by default | optional `Current State` refresh | 会話主導更新が取りこぼした時だけ補助する | 常時主役として state を上書きしない |
| `Repo Sync Guard` | weekday late afternoon | `tmp/automation/*`, short inbox note | sync 前に安全条件を確認し、fast-forward 可能時だけ進める | reset / discard / high-risk path の自動上書きをしない |
| `Workspace Harness Check` | on demand / before risky work | terminal summary / check status | entrypoints, archive, state materials, tmp hygiene をまとめて点検する | 作業内容そのものを代行しない |

## What We Learned In Practice

- capture / state / report を混ぜると、どこで何が壊れたか追いにくくなる
- `Current State` 系は blind update せず、会話主導を主役にしたほうが温度も精度も安定する
- raw log sync は report 生成の前段整理に留めたほうが責務がきれいに分かれる
- guard 系 automation は成果物を増やすより、**何を止めるか** を明記したほうが事故を減らせる

## Why This Shape

automation を 1 つの万能レイヤーとして扱うと、`保存` `要約` `state 更新` `共有向け整形` が同じ prompt に集まりやすくなります。  
この sample では、それを避けるために `capture layer` `state layer` `report layer` `sync / guard layer` を分けています。

実運用では、この分離があることで

- raw log は raw log のまま残る
- state は短く保たれる
- report は成果物として読める
- guard は止血係として働く

という役割の違いが見えやすくなります。
