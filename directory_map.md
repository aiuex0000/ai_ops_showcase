# Directory Map

この成果物で見せたいのは、巨大な repo 全体そのものではなく、**実際の repo 構造に近いまま、AI 実務運用として意味が通る部分を切り出した構成** です。

## 実構造に寄せた構成の例

```text
workspace/
  AGENTS.md
  GEMINI.md
  CLAUDE.md
  scripts/
    check-workspace-harness.ps1
    collect-daily-report-materials.ps1
    get-current-state-materials.ps1
  docs/
    workspace_manifest/
      workspace_manifest.md
    ai_ops_showcase/
      README.md
      operating_model.md
      directory_map.md
      sanitization_policy.md
      samples/
  .agent/
    .rules/
      Global.md
      luna.md
      you.md
    luna_memory/
    README.md
    skills/
      README.md
      luna-bootstrap-auditor/
      codex-runtime-tuner/
      home-automation-planner/
      workspace-mothership-organizer/
    workflows/
      current-state-sync.md
      daily-report.md
      session-lanes.md
  .agents/
    README.md
    skills/
    workflows/
    marketplace-bridge.json
  Obsidian/
    AI/
      codex/
      copilot/
      日誌/
```

## どこに何を置くか

### ルート

- `AGENTS.md`
  - AI 向けの薄い入口
- `GEMINI.md` `CLAUDE.md`
  - ツール別の薄い入口
- `scripts/`
  - guardrail や運用補助のスクリプト
- `docs/`
  - 人間向けの索引、方針、showcase

### `.agent/`

- `.rules/`
  - 回答方針、安全、役割分担などの正本
- `luna_memory/`
  - エージェント運用に必要な長文メモリ層
- `skills/`
  - 自作 Skill と generic skill の本文正本
- `workflows/`
  - 日報、state 同期、調査レーン分離などの型
- `knowledge_loops/`
  - セッションをまたいで蓄積する運用知識のテーマ別記録層
- `README.md`
  - このレイヤー全体の読み順を示す入口

### `.agents/`

- Codex 系で露出が必要な互換レイヤー
- 正本ではなく runtime surface のための補助層

### `Obsidian/AI/`

- 各 AI との会話やエクスポートを保存する archive 層
- 日報や引き継ぎ時の根拠ソースになる
- live state の代わりではなく、必要時に戻る場所として扱う

## Showcase での見せ方対応表

| 実 repo の場所 | Showcase での見せ方 | 理由 |
| --- | --- | --- |
| `AGENTS.md` / ツール別入口 | `AGENTS.sample.md` / `copilot_instructions.sample.md` | 入口の考え方を見せたい |
| `.agent/.rules` `.agent/luna_memory` | `operating_model.md` と解説本文 | private な本文は外し、役割だけ残す |
| `.agent/skills` | `skills_index.sample.md` | 自作 Skill と generic skill の境界を見せる |
| `.agent/workflows` | `daily_report_workflow.sample.md` など | 反復手順の型を見せる |
| `.agents/` | `workspace_manifest.sample.md` と解説 | runtime surface としての役割を見せる |
| `scripts/` | `check_workspace_harness.sample.ps1` | guardrail の考え方を見せる |
| `Obsidian/AI/` | `daily_report_workflow.sample.md` と `README` | archive の役割だけを見せる |
| 運用間のつなぎ目 | `check_script_evolution.md` / `archive_to_report_flow.md` / `automation_matrix.sample.md` | 実運用で増えた責務分離と改善履歴を見せる |

## どこを抽象化しているか

- private なメモリ本文や会話本文は見せない
- 絶対パスや個人用ノート名は一般化する
- 固有の関係性や人格の濃い本文は抽象化する
- ただし、`専用エージェント` `自作 Skill` `state stack` `archive` `guardrails` の存在感は消さない

## 設計上のポイント

- 入口は薄くする
- 長文本文は `.agent/` の正本レイヤーへ逃がす
- 自作 Skill と generic skill を同じ index で管理しつつ役割は分ける
- workflow は `反復手順の型`、Skill は `作業ショートカット` として分ける
- state note は長文ログにしない
- archive は `後で戻る場所` として分離する
- runtime surface 用の `.agents/` を source-of-truth と混同しない
- guardrail は `scripts/` に寄せて点検を自動化する

## この構成が向いているケース

- AI を 1 つではなく複数使う
- 作業ログや会話の再利用性を上げたい
- 入口ファイルが増えて散らかってきた
- 毎回同じ前提説明をするのがつらい
- 個人運用でも再現性を上げたい
