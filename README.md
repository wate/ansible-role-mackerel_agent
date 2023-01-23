mackerel_agent
=================

Setup mackerel agent

OS Platform
-----------------

### Debian

- bullseye
- buster

Role Variables
--------------

設定方法の詳細については[defaults/main.yml](defaults/main.yml)のサンプルコードを参照してください。

### `mackerel_agent_packages`

インストールするパッケージ

### `mackerel_agent_api_key`

APIキー

### `mackerel_agent_active_and_enabled_on_system_startup`

サービスの有効化および自動実行の設定

### `mackerel_agent_extra_setting`

Mackerelエージェントの追加設定(プラグインの設定など)

Example Playbook
--------------

```yaml
- hosts: servers
  roles:
    - role: mackerel_agent
```

License
--------------

Apache License 2.0
