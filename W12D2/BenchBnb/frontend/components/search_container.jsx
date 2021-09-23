import {connect} from 'react-redux'
import { fetchBenches } from '../actions/bench_actions'
import { Search } from './search'

const mSTP = (state) => ({
    benches: Object.values(state.entities.benches)
})

const mDTP = (dispatch) => ({
    fetchBenches: () => dispatch(fetchBenches())
})

export default connect(mSTP, mDTP)(Search)