# MyQiita

- QiitaClientをピンクで作る。
- git-push-hackerthonで後悔したので同じOauth2のサンプルとして作った。


![](https://github.com/churabou/MyQiita/blob/master/demo.gif)

設計はオリジナル。

- view
- controller
- viewModel
- navigator

を作って見た。一般的なMVVMと同じ感じ+Navigatorクラスを追加した感じ。
RxSwiftを個人で使うメリットを感じていないが勉強のため使って見た。

<strong>今後</strong>

- qiitaのapiがマークダウンの本文を返してくれたので、webViewでloadするだけじゃ勿体無いと思い、jsでmdを表示してみようとしているのがあまりうまく行っていない
- reamlで履歴とかお気に入りとか自作(mac book airで開発中で realmのインストールが時間かかるのでやっていない)
- 検索機能の追加





