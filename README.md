# What is Flutx

Flutx is a state management library for Flutter apps. It serves as a centralized store for all the Widgets in an app, with rules ensuring that the state can only be mutated in a predictable fashion.

## State

Flutx uses a _single state tree_ - that is, this single object contains all your app level state and serves as the "single source of truth". This also means usually you will have only one store for each application. A single state tree makes it straightforward to locate a specific piece of state, and allows us to easily take snapshots of the current app state for debugging purposes.

However, we have preserved modularity as all states have to be split into sub states.

## Mutations

The only way to actually change state in a Flutx store is by commiting a mutation. These are very similar to events: each mutation has

## Actions

Actions are similar to mutations, the differences being that:

- Instead of mutating the state, actions commit mutations.
- Actions can contain arbitrary asynchronous operations.

Action handlers receive a context object which exposes the same set of methods/properties on the store instance, so you can call `context.commit` to commit a mutation, or access the state and root state via `context.state` and `context.rootState`. We can even call other actions with `context.dispatch`.

Actions act as conveince part to bring modularity and clearity instead of calling `commit` directly from store.

## State

All state (rootState) is stored into substates (state). Each substate containts its own state, mutations, and actions - it's fractal all the way down.

Due this, mutations will receive it's local state as the first argument.

Similarly, inside state actions, `context.state` will expose the local state, and root state will be exposed as `context.rootState`.

### Namespacing

All substates are namespaced by their class names.

### Hydrating state

Ability to hydrate state was corner stone for designing this state management library.

Simply set `preserveState` to true for class that extends state and define .
