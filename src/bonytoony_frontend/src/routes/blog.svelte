<script>
  let title = '';
  let content = '';
  let posts = [];

  async function addPost() {
    await fetch('/api/personal-website/addBlogPost', {
      method: 'POST',
      body: JSON.stringify({ title, content, author: 'Admin' }),
    });
    title = '';
    content = '';
    await fetchPosts();
  }

  async function fetchPosts() {
    const res = await fetch('/api/personal-website/getBlogPosts');
    posts = await res.json();
  }

  // Fetch posts on component mount
  fetchPosts();
</script>

<main>
  <h1>Blog Posts</h1>
  <div>
    <input bind:value={title} placeholder="Post Title" />
    <textarea bind:value={content} placeholder="Post Content"></textarea>
    <button on:click={addPost}>Add Post</button>
  </div>

  <h2>Existing Posts</h2>
  <ul>
    {#each posts as post}
      <li>
        <h3>{post.title}</h3>
        <p>{post.content}</p>
        <small>By {post.author} on {post.timestamp}</small>
      </li>
    {/each}
  </ul>
</main>

<style>
  main {
    padding: 1rem;
    font-family: Arial, sans-serif;
  }
</style>
