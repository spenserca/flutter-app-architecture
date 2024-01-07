# flutter-app-architecture

A hands-on walk through of flutter app architecture. Following the blog series from codewithandrea.com.

## Presentation Layer

https://codewithandrea.com/articles/flutter-presentation-layer/

The presentation layer consists of `Widgets` which allow the user to view and modify data on the screen, and
`Controllers` which contain the business logic that is applied to the data the user is modifying/viewing.

> By implementing a custom controller class based on `AsyncNotifier`, we've separated our business logic from the UI code.
>
> As a result, our widget class is now completely stateless and is only concerned with:
> - watching state changes and rebuilding as a result (with `ref.watch`)
> - responding to user input by calling methods in the controller (with `ref.read`)
> - listening to state changes and showing errors if something goes wrong (with `ref.listen`)
>
> Meanwhile, the job of our controller is to:
> - talk to the repository on behalf of the widget 
> - emit state changes as needed
>
> And since the controller doesn't depend on any UI code, it can be easily unit tested, and this makes it an ideal place to store any widget-specific business logic.

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

## Domain Layer

