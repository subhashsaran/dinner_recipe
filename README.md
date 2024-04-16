## Setup Instructions

**Prerequisites:**

- Ensure Ruby and Rails is Installed.
- Ensure PostgreSQL is Installed.

**Installation:**

1. **Clone the repository:**

   ```bash
   git clone https://github.com/subhashsaran/dinner_recipe.git
   cd dinner_recipe
   ```

2. **Install dependencies:**

   ```bash
   bundle install
   ```

3. **Create and migrate the database:**

   ```bash
   rails db:create && rails db:migrate
   ```

4. **Import recipe data (Optional):**

   This step requires a `tmp/recipes-en.json` file containing recipe data in JSON format.

   ```bash
   rails recipes:import
   ```

5. **Run tests:**

   ```bash
   bundle exec rspec
   ```

6. **Start the Rails server:**

   ```bash
   rails server
   ```

## Project Progress

I maintained a clean commit history, allowing to track the project's development step-by-step. Each commit represents a small user story delivered.

**Initial Version**

The initial version focused on displaying a list of recipes along with their ingredients. Here are some potential improvements:

- **Enhanced Ingredient Display:** A more aesthetically pleasing way to display ingredients.
- **Search Result Highlighting:** Replicate the behavior of search engines like Google and GitHub, highlighting matching ingredients within each recipe.

Initial Version:
<img width="1575" alt="Screenshot 2567-04-15 at 10 49 47" src="https://github.com/subhashsaran/dinner_recipe/assets/9843667/f0d2667e-c68b-4a83-aa3a-f64d362eb3ff">

**Improved Version with Basic Syntax Highlighting**

This commit introduced basic syntax highlighting for ingredients (commit 07e55309: [https://github.com/subhashsaran/dinner_recipe/commit/07e55309](https://github.com/subhashsaran/dinner_recipe/commit/07e55309)). While not the most optimal solution, it provides a visual improvement over the initial version.

Improved Version:
<img width="1581" alt="Screenshot 2567-04-15 at 15 22 11" src="https://github.com/subhashsaran/dinner_recipe/assets/9843667/a5da9e1c-6f64-4964-a9f1-2b4ac503a39c">


## Areas for Improvement

Here are some potential improvements we can discuss during the review call:

**Search Ranking:**

- Implement sorting by the number of matching search ingredients within a recipe. This could involve assigning a score to each recipe based on the number of matches, with higher-scoring recipes displayed at the top.

**Pagination:**

- Currently, for basic search items like sugar, salt, etc., there are thousands of matching records, the search results are displayed in a single page. This could be improved by adding pagination to the search results.

**Recipe Import:**

- Improve the recipe import process:
    - Use `activerecord-import` to bulk import recipes and ingredients in a single transaction, significantly improving efficiency compared to individual inserts.
    - Add a progress bar to indicate import progress.
    - Prevent duplicate record creation during multiple imports.

**Search Functionality:**

- Consider integrating Basic Elasticsearch using Searchkick to enhance search results' relevance and speed.

**Frontend Enhancements (Future Consideration):**

- Explore using React to implement single-page application features for a more dynamic user experience.

**Code Quality:**

- Add Rubocop to check for coding style issues and enforce best practices.