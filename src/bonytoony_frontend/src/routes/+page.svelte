<script>
  let username = '';
  let password = '';
  let greeting = '';
  let isAdmin = false;

  async function fetchGreeting() {
    const res = await fetch('/api/personal-website/greet', {
      method: 'POST',
      body: JSON.stringify({ name: username }),
    });
    greeting = await res.text();
  }

  async function adminLogin() {
    const res = await fetch('/api/personal-website/adminLogin', {
      method: 'POST',
      body: JSON.stringify({ username, password }),
    });
    const result = await res.json();
    isAdmin = result;
    if (isAdmin) {
      greeting = "Admin logged in successfully!";
    } else {
      greeting = "Admin login failed!";
    }
  }
</script>

<main>
  <h1>Welcome to Lolly and Bony Website</h1>

  <div>
    <h2>Get Greeting</h2>
    <input bind:value={username} placeholder="Enter your name" />
    <button on:click={fetchGreeting}>Get Greeting</button>
    <p>{greeting}</p>
  </div>

  <div>
    <h2>Admin Login</h2>
    <input bind:value={username} placeholder="Admin Username" />
    <input type="password" bind:value={password} placeholder="Admin Password" />
    <button on:click={adminLogin}>Login</button>
    {#if isAdmin}
      <p>Admin Access Granted!</p>
    {:else if greeting && !isAdmin}
      <p>Admin Access Denied!</p>
    {/if}
  </div>
</main>

<style>
  main {
    padding: 1rem;
    font-family: Arial, sans-serif;
  }
</style>
￼Enter
