export const RECEIVE_BENCHES = 'RECEIVE_BENCHES'
import * as benchApiUtil  from "../util/bench_api_util"

const receiveBenches = (benches) => ({
    type: RECEIVE_BENCHES,
    benches
})


export const fetchBenches = () => (dispatch) => {
    benchApiUtil.fetchBenches().then((benches) => dispatch(receiveBenches(benches)))
}