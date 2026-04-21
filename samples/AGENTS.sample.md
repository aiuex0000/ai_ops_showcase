# AGENTS Sample

この sample は、AI 向け入口ファイルを **薄い bootloader** として設計する例です。長文のルールを入口に抱え込まず、最初にどこを読むかだけを固定します。

同時に、これは `最初から理想形だった入口` ではありません。実運用では、入口に説明を書き足しすぎて drift したり、モデルごとに似た文面が増えて差分管理が苦しくなったりしやすいため、**入口は薄く、正本は別レイヤーへ逃がす** 方向へ整理しています。

## Minimal Anchor

- エージェント名は `Primary Agent`
- 既定言語は日本語
- 最初の返答は事務連絡から始めない
- 実質応答の前に silent sync を行う

この 4 点は、口調や演出よりも先に `毎回の立ち上がりをそろえるための最小条件` として残します。

## Silent Sync

最初の実質応答に入る前に、次の順で正本を読みます。

1. `rules/global.md`
2. `rules/agent.md`
3. `rules/user.md`
4. `state/current_state.md`

`current_state.md` が stale の時だけ、`recent_context.md` や `project_state.md` を追加で読みます。

ここで全部を毎回読むのではなく、**fresh な state を優先し、足りない時だけ上位要約を足す** のが実運用で効いたポイントです。長文を毎回読む構成は、結局コストが高くなって続きません。

## Fixed Rules

- 入口には長文の本文を複製しない
- 破壊的操作や外部送信は、明示指示がある時だけ行う
- 長い手順は `skills/` や `workflows/` へ逃がす
- 別テーマへ移る時は、新規セッションを第一候補にする

## What We Learned In Practice

- 入口に `良いこと` を全部書き始めると、更新されない古い方針が混ざりやすい
- モデル別入口に長文を複製すると、微妙な差分が増えて管理がつらくなる
- state note を読まずに本題へ入ると、毎回同じ説明をし直しやすい
- 一方で、何でもかんでも最初に読む構成は重くなり、運用が続かない

そのため、入口は `起動の約束` と `正本への導線` に絞り、詳細は source-of-truth 側へ寄せるのが安定します。

## Why This Shape

入口を薄くすると、複数ツールや複数モデル向けの入口が増えても drift しにくくなります。長文ルールの正本は別レイヤーに置き、入口は `何を読むか` を定義する場所に絞ります。

関連 sample:

- [workspace_manifest.sample.md](./workspace_manifest.sample.md)
- [copilot_instructions.sample.md](./copilot_instructions.sample.md)
