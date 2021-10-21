// axios のerror と　response　をインポート
import { AxiosError, AxiosResponse } from 'axios'

// promise の中には「正常データ = resolve」と「エラー = reject」がある
// promise のデータ変換関数 backendから返ってきたデータを変換する
export function transformData<T>(promise: Promise<AxiosResponse<T>>) {
  const data = promise.then(
    // val.dataをデータ型の汎用型Tとして、valにAxiosResponseにセットする
    // https://techacademy.jp/magazine/32604
    (val: AxiosResponse<T>) => [null, val.data] as [null, T],
    // err をAxiosErrorと名前をつけて、errにAxiosErrorをセットする
    (err: AxiosError) => [err, null] as [AxiosError, null]
  )
  // data　を返す
  return data
}
