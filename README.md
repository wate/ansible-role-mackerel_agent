mackerel-agent
=========

mackerel-agentのインストールとセットアップを行います

Role Variables
--------------

### mackerel_agent_apikey

MackerelのAPIキーを指定します

```yaml
mackerel_agent_apikey: "your-api-key-here"
```

### mackerel_agent_install_agent_plugins

エージェントプラグインをインストールするか否かを指定します

```yaml
mackerel_agent_install_agent_plugins: no
```

### mackerel_agent_install_check_plugins: no

チェックプラグインをインストールするか否かを指定します

```yaml
mackerel_agent_install_check_plugins: no
```

### mackerel_agent_active_and_enabled_on_system_startup

Mackerelエージェントのインストール後に、起動およびサービスを有効化するか否かを指定します

```yaml
mackerel_agent_active_and_enabled_on_system_startup: yes
```

### mackerel_agent_cfg

Mackerelエージェントの設定を定義します

```yaml
mackerel_agent_cfg:
  pidfile: /var/run/mackerel-agent.pid
  root: /var/lib/mackerel-agent
  verbose: no
  display_name: My Host
  http_proxy: http://localhost:8080
  roles:
    - My-Service:app
    - Another-Service:db
  host_status:
    on_start: working
    on_stop: poweroff
  filesystems:
    ignore: /dev/ram.*
    use_mountpoint: yes
  plugin:
    metrics:
      apache2: mackerel-plugin-apache2
    checkes:
      log: "/path/to/check-log --file=/path/to/file --pattern=REGEXP --warning-over=N --critical-over=N"
      procs:
        command: "/path/to/check-procs --pattern=PROCESS_NAME --state=STATE --warning-under=N"
```

Example Playbook
----------------

```yaml
- hosts: servers
  roles:
     - { role: mackerel-agent }
```

License
-------

MIT
