# Skills Index Sample

この sample は、skill を `repo-specific` と `generic` に分けて管理する考え方を、実際の repo に近い粒度で見せるための一覧です。ここでは実際に近い自作 Skill 名も一部残しています。

## Repo-Specific Skills

- `luna-bootstrap-auditor`
  - 入口の読み順、silent sync、state stack の責務分離を監査する
- `codex-runtime-tuner`
  - AI runtime config や permissions 周辺を整える
- `daily-report-assist`
  - 日報生成と state 反映の流れを支援する
- `workspace-mothership-organizer`
  - workspace の分類設計や低リスク整理を扱う
- `home-automation-planner`
  - home 側 automation と archive 連携の設計を扱う
- `site-migration-debugger`
  - 特定案件に閉じたデバッグ手順を再利用しやすくする
- `knowledge-loop-review`
  - knowledge loop を点検し、再発防止メモを見直す

## Generic Skills

- `obsidian-markdown`
  - Markdown note の編集
- `obsidian-cli`
  - vault 操作や検索
- `windows-automation-expert`
  - Windows 自動化の補助
- `defuddle`
  - Web ページの要点抽出
- `json-canvas`
  - 図やノード構造の編集
- `obsidian-bases`
  - Obsidian database 的なレイヤーの編集

## Why Split Skills

この分け方には次の利点があります。

- その repo に閉じた知識を generic skill へ混ぜずに済む
- 再利用できる skill だけを別環境へ持ち出しやすい
- `この workspace 特有の手順` と `どこでも使える手順` を説明しやすい
- `自作 Skill で何を仕組み化したか` を、そのまま成果物として見せやすい

## What We Learned In Practice

- 自作 Skill が増えると、便利さの反面 `どこまでが repo 固有か` が見えにくくなる
- generic skill へ repo の事情を混ぜ始めると、別環境へ持ち出しにくくなる

そのため、index 側で `repo-specific` と `generic` の境界を明示しておくと、運用も説明もしやすくなります。

## Related Layers

- ルール本文は `.agent/.rules/`
- 長文メモリは `.agent/luna_memory/`
- 繰り返し手順は `.agent/workflows/`
- skill はその間にある **作業ショートカット** として扱う
