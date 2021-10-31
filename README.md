#  Stanford Swift Education - Very Basic - Refresher

### Some useful hints:

#### **Outlet types:** 
 - Outlet
 - Action
 - Outlet Collection with Index - very useful



#### Debugger

- lldb: po  - print out object
- lldb: p <object> - formated print out object



#### Stride

Swift has a helpful **stride()**, which lets you move from one value to another using any increment – and even lets you specify whether the upper bound is exclusive or inclusive.

**stride(from:to:by:)** counts from the start point up to by excluding the to parameter. If you want to count up and including the to parameter, you should use **stride(from:through:by:)**

<details>
  <summary markdown="span">stride(from:to:by:) Code Example</summary>

```
for i in stride(from: 0, to: 0.5, by: 0.1) {
    print(i)
}
```
</details>
