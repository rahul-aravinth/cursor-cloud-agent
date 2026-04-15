# Design Patterns Overview

This document introduces common software design patterns and when to use them.

## Why design patterns matter

Design patterns provide tested approaches to recurring design problems. They help teams:

- Share a common vocabulary.
- Keep code easier to change.
- Reduce ad-hoc architecture decisions.

## Pattern categories

### Creational patterns

Creational patterns focus on object creation and configuration.

- **Singleton**: Ensure a class has only one instance and a global access point.
- **Factory Method**: Delegate object creation to subclasses or dedicated factories.
- **Builder**: Construct complex objects step by step.

Use creational patterns when object setup becomes complex or needs flexibility.

### Structural patterns

Structural patterns describe how classes and objects are composed.

- **Adapter**: Convert one interface into another expected interface.
- **Decorator**: Add behavior to objects dynamically without subclassing.
- **Facade**: Provide a simplified API over a complex subsystem.

Use structural patterns to integrate existing components and reduce coupling.

### Behavioral patterns

Behavioral patterns organize communication and responsibilities between objects.

- **Strategy**: Encapsulate interchangeable algorithms behind one interface.
- **Observer**: Notify dependent objects when state changes.
- **Command**: Represent requests as objects for queuing, logging, or undo.

Use behavioral patterns when control flow and responsibilities become scattered.

## Practical guidance

1. Start simple and add a pattern only when a real problem appears repeatedly.
2. Prefer readability over strict pattern purity.
3. Document intent in code and pull requests when introducing a pattern.
4. Revisit patterns over time; the right choice can change as requirements evolve.

## Common pitfalls

- Applying patterns too early (over-engineering).
- Using patterns only by name, without understanding the trade-offs.
- Mixing multiple patterns in one area without clear boundaries.

## References

- *Design Patterns: Elements of Reusable Object-Oriented Software* (Gamma, Helm, Johnson, Vlissides)
- *Head First Design Patterns* (Freeman, Robson)
