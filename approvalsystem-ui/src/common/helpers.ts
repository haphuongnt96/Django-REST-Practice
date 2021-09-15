import { AxiosError, AxiosResponse } from 'axios'

export function transformData<T>(promise: Promise<AxiosResponse<T>>) {
  const data = promise.then(
    (val: AxiosResponse<T>) => [null, val.data] as [null, T],
    (err: AxiosError) => [err, null] as [AxiosError, null]
  )
  return data
}
