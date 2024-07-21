# Sweet Recipes

**Sweet Recipes is a beta iOS app that allows users to explore dessert recipes from the [TheMealDB](https://themealdb.com/api.php)**

![SweetRecipes](https://github.com/user-attachments/assets/1f2f7d95-232c-4473-8d66-45a48546fe62)

## Details: 
**The beta app currently has two views:**
- Home View:
  - display a list of dessert recipe cards, the card contains a hero image and the recipe name under it.
  - a refresh button on the top-right of the toolbar(also this view is refreshable), it is used to refresh the data when error occurred.
  - click any card will navigate to its detail view.
 
- Detail View:
  - display the corresponding recipe detail, which are the recipe image, name, instructions, and ingredients.
  - there are three ways to go back to the home view:
    -  use the close button on the top-left corner on the view
    -  double-tap on the screen
    -  swipe from left to right action


## Development:
Requirements: 
- Xcode 15.4
- Swift 5.5 or later

Compatibility: 
- iPhone: iOS 15.0 or later
- iPad: iOS 15.0 or later

## For preview env:
There are two data files that being used for all previews, the previews will not build without these files:
- SweetRecipes/Preview Content/MealDetailData.json
- SweetRecipes/Preview Content/MealsData.json
  
If there are any issues for rendering the previews, please make sure these files are added to the Bundle.

<img width="1518" alt="Screenshot 2024-07-18 at 10 08 43 PM" src="https://github.com/user-attachments/assets/9337493d-dd82-49d3-9ec0-98fd45feb6d3">

## Caching data strategy
**All downloaded images are cached in-memory, and no network calls for the same image urls in the later uses until the app is terminated.**

This caching strategy will prevent the same image network calls on the detail page, so it cached all images on the home view when browsing the recipes, and use the cached images on the detail view. It is also helpful when the LazyVGrid re-render the dropped items, as it will use the cached image when rendering, if the cached image exist. 

Restart the app will empty all cached images, and fetch the images again. This way we can free the used memory and fetch the newest images from the server in case they gets updated on the server. 








