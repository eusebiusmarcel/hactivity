import { createStore } from 'redux'

const initialState = {
  activities: []
}

const rootReducer = (state, action) => {
  console.log(action.type)
  switch (action.type) {
    default:
      return state
  }
}

const configureStore = () => {
  const store = createStore(rootReducer, initialState)
  return store
}

export default configureStore
