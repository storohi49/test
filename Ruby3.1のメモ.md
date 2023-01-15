**Rubyのバージョンは以下の通り  
** 注）C:\Users\kreis>ruby -v  
**ruby 3.1.3p185 (2022-11-24 revision 1a6b16756e) [x64-mingw-ucrt]   

# tiny_tdsについて

### 下記の方法で、インストールする事は出来た。 


1. 初回は失敗する
```
gem install tiny_tds
```

2. だけど、「C:\Ruby31-x64\msys64\ucrt64\include\freetds」は出来てるはずなので、以下を実行する
```
gem install tiny_tds -- --with-freetds-include=C:\Ruby31-x64\msys64\ucrt64\include\freetds
```
→ **これで、成功するはず**

### ローカルにインストールする方法

以下をGemfileに書く 

```
gem 'solargraph' 
gem 'debug', '~> 1.7', '>= 1.7.1' 
gem 'tiny_tds', '~> 2.1', '>= 2.1.5',:path => 'C:\Ruby31-x64\lib\ruby\gems\3.1.0\gems\tiny_tds-2.1.5'
```

**これで、bundle installする**

# debugについて

### とりあえず、下記イメージで、インストール
```
gem 'debug', '~> 1.7', '>= 1.7.1' 
```

### launch.jsonはこんな感じ
```
{
    // IntelliSense を使用して利用可能な属性を学べます。
    // 既存の属性の説明をホバーして表示します。
    // 詳細情報は次を確認してください: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "type": "rdbg",
            "name": "Debug current file with rdbg",
            "request": "launch",
            "script": "${file}",
            "args": [],
            "askParameters": false,
            "debugPort": "12345",
            "useBundler": true,
            "waitLaunchTime": 3000
        },
        {
            "type": "rdbg",
            "name": "Attach with rdbg",
            "request": "attach"
        }
    ]
}
```
