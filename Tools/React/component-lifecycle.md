
## The Component Lifecycle

https://reactjs.org/docs/react-component.html

Each component has several "lifecycle methods" that you can override to run code at particular times in the process.


### Mounting

These methods are called in the following order when an instance of a component is being created and inserted into the DOM:

* constructor()
* static getDerivedStateFromProps()
* render()
* componentDidMount()

### Updating

An update can be caused by changes to **props** or **state**. These methods are called in the following order when a component is being re-rendered.

* static getDerivedStateFromProps()
* shouldComponentUpdate()
* render()
* getSnapshotBeforeUpdate()
* componentDidUpdate()