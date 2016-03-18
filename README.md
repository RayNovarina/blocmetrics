Build an analytics service to track events on websites.
Use Case

There are plenty of good analytic services, but that doesn't mean you can't build a better one. Your analytics service will offer a few key features:

    A client-side JavaScript snippet that allows a user to track events on their website.
    A server-side API that captures and saves those events to a database.
    A Rails application that displays the captured event data for a user.

User Stories
User Story 	Difficulty Rating
1) Intro
2) As a user, I want to sign up for a free account by providing a name, password, and email 	2
3) As a user, I want to sign in and out of Blocmetrics 	2
4) As a user, I want to register an application with Blocmetrics for tracking 	3
5) As a user, I want events associated with registered applications 	3
6) As a developer, I want to receive incoming events in an API controller 	2
7) As a user, I want to use JavaScript to capture client-side events in my application 	2
8) As a user, I want to see a graph of events for each registered application 	3

=====================================================

Checkpoint 7. Client-side JavaScript

Implementation notes:

1) Added following script to my previous project, Blocmarks at:
blocmarks/app/views/layouts/application.html.erb

```
<head>
  ...........
  <script>
    // For sending events to the blocmetrics api per Bloc at:
    //   https://www.bloc.io/users/ray-novarina/checkpoints/1702?roadmap_section_id=124
    var blocmetrics = {};
      blocmetrics.report = function(eventName){
        alert('blocmetrics.report(' + eventName + ')')
        var event = { event: { name: eventName } };
        var request = new XMLHttpRequest();
        request.open("POST", "http://localhost:3000/api/events", true);
        request.setRequestHeader('Content-Type', 'application/json');
        request.send(JSON.stringify(event));
      };
  </script>
</head>
```
2) Generated fixed test data via link in the Blocmarks header links:
```
<div class="css-navbar_left">
  <div class="css-navbar-header">
    <a class="navbar-brand css-navbar-no-href"
      onclick="blocmetrics.report('header_test')"
    >blocmetrics.report()
    </a>
    ........
  </div>
  ..........
</div>  
```
