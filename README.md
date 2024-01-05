# flutter-app-architecture

A hands-on walk through of flutter app architecture. Following the blog series from codewithandrea.com.

## Presentation Layer

https://codewithandrea.com/articles/flutter-presentation-layer/

TODO

## Application Layer

https://codewithandrea.com/articles/flutter-app-architecture-application-layer/


> The application layer contains `Services` which communicate between controllers in the `Presentation Layer`
> and `Repositories` in the `Data Layer`.
>
>If you find yourself writing some logic that:
>
> - depends on multiple data sources or repositories
> - needs to be used (shared) by more than one widget
>
>Then consider writing a service class for it. Unlike controllers that extend `StateNotifier`, service classes don't
> need to manage any state, as they hold logic that is not widget-specific.
>
>Service classes also don't care about data serialization or how to get data from the outside world (that is what the
> data layer is for).
>
>Lastly, service classes are often unnecessary. There's no point in creating a service class if all it does is forward
> method calls from a controller to a repository. In such a case, the controller can depend on the repository and call
> its methods directly. In other words, the application layer is optional.
>
>Finally, if you're following the feature-first project structure outlined here, you should decide if you need service
> classes on a feature-by-feature basis.