// Mock用のJSONレスポンスサーバーの初期化設定
import jsonServer from 'json-server';
const server = jsonServer.create();

// Database構築用のJSONファイル
//const router = jsonServer.router('db/db.json');

// 各種設定用
const middlewares = jsonServer.defaults();
// リライトルールを設定する
//const rewrite_rules = jsonServer.rewriter();
//server.use(rewrite_rules);

// ミドルウェアを設定する (※コンソール出力するロガーやキャッシュの設定等)
server.use(middlewares);

// ルーティングを設定する
//server.use(router);

// サーバをポート3000で起動する
server.listen(3000, () => {
    console.log('CharacteristicStyleSwiftUIExample Mock Server is running...');
});
