# Sinatra Blog

Our Sinatra blog will still be object oriented and it will follow the model-view-controller pattern.

Even though we are building this for the Web, we still want Post and Blog classes. Some of the functionality of those classes needs to change since displaying information to the user on the Web is different. In particular, any code that affects how the posts look for the user will be removed from the classes. How the information is shown to the users is the job of the view. Our classes are not our view. Sinatra has the views/ folder for our ERBs. Those will be our views.

Our Post and Blog classes represent the information that we are trying to manage, organize and display. In other words, our classes are acting as our models. Our classes and objects are kind of like a digital representation (model) of that information.


### Iterations

 1. List of posts
 2. Showing latest posts first
 3. Post details page
 4. Creating posts
 5. Category and outhor
