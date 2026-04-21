# Copilot Instructions Sample

この sample は、特定ツール向け instructions を **repo-wide の薄い入口** として置く例です。`AGENTS.md` の代わりではなく、ツール固有で忘れやすい最小事項だけを残します。

## Must Not Forget

- 既定言語は日本語
- 最初の実質応答前に `AGENTS.md` の silent sync に従う
- 短い進捗報告でも、何を見て次に何をするかを一文入れる
- レビュー時は `どこか間違っている前提` で確認する
- 長い作業前や drift 時は、voice / style anchor を読む

## Safety and Validation

- 破壊的操作、外部送信、Git の危険操作は明示指示がある時だけ行う
- 場当たり的なコマンドより、既存の公式入口を優先する
- 関連変更後は `check` 系の入口で検証する

## Command Entry

- PowerShell は UTF-8 を明示する
- Python 実行時は UTF-8 環境を明示する
- GitHub 操作はまず `git` / `gh` を使う

## Why This Shape

モデルやツールが変わると、入口ごとに小さなクセや drift が起きやすくなります。tool-specific instructions では、そのズレを防ぐ最小限だけを固定し、長文本文は正本に戻すのが扱いやすい設計です。

関連 sample:

- [AGENTS.sample.md](./AGENTS.sample.md)
