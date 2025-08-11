defmodule MtgwebWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available.
  The "root" layout is a skeleton rendered around other layouts.
  """
  use MtgwebWeb, :html

  # Define root template directly from root_simple.html.heex content
  def root(assigns) do
    ~H"""
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta name="csrf-token" content={get_csrf_token()}>
        
        <!-- SEO Meta Tags -->
        <meta name="description" content={assigns[:meta_description] || "Professional accounting, bookkeeping, and CFO services for small to medium businesses. Expert financial management solutions starting at $250/month. Trusted by 100+ companies."}>
        <meta name="keywords" content="accounting services, bookkeeping, CFO services, financial management, QuickBooks, small business accounting, Portland accountant, fractional CFO">
        <meta name="author" content="MTG Consulting">
        
        <!-- Open Graph Tags -->
        <meta property="og:title" content={assigns[:og_title] || "MTG Consulting - Professional Accounting & CFO Services"}>
        <meta property="og:description" content={assigns[:og_description] || "Expert accounting, bookkeeping, and CFO services for growing businesses. Trusted by 100+ companies nationwide."}>
        <meta property="og:image" content="https://mtg-consulting.net/images/mtglogo.jpg">
        <meta property="og:url" content={assigns[:og_url] || "https://mtg-consulting.net"}>
        <meta property="og:type" content="website">
        <meta property="og:site_name" content="MTG Consulting">
        
        <!-- Twitter Cards -->
        <meta name="twitter:card" content="summary_large_image">
        <meta name="twitter:title" content={assigns[:og_title] || "MTG Consulting - Professional Accounting & CFO Services"}>
        <meta name="twitter:description" content={assigns[:og_description] || "Expert accounting, bookkeeping, and CFO services for growing businesses."}>
        <meta name="twitter:image" content="https://mtg-consulting.net/images/mtglogo.jpg">
        
        <.live_title suffix=" · Expert Financial Management">
          <%= assigns[:page_title] || "MTG Consulting - Professional Accounting & CFO Services" %>
        </.live_title>
        <link phx-track-static rel="stylesheet" href={~p"/assets/app.css?v=2"}/>
        <script defer phx-track-static type="text/javascript" src={~p"/assets/app.js"}></script>
        <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
        <link rel="icon" type="image/x-icon" href="/favicon.ico" />

        <script defer src="https://unpkg.com/alpinejs@3.14.9/dist/cdn.min.js"></script>
      </head>
      <body data-theme="mtg" class="font-sans" style="background-color: rgb(29, 9, 89); min-height: 100vh;">
        <div class="min-h-full" style="background-color: rgb(29, 9, 89)">
          <nav class="bg-mtg-purple" x-data="{ open: true }">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
              <div class="flex items-center justify-between h-16">
                <div class="flex items-center">
                  <div class="shrink-0">
                    <a href="/">
                      <img height="60" width="200" class="h-[60px] w-auto" src="/images/mtglogo.jpg" alt="MTG Logo">
                    </a>
                  </div>
                  <div class="hidden sm:ml-6 sm:block">
                    <div class="flex items-baseline space-x-1">
                      <a href="/articles" class="text-white hover:text-orange-400 transition-colors duration-200 px-3 py-2 rounded-md font-display text-xl" style="color: rgb(255, 255, 255);" onmouseover="this.style.color='rgb(255, 127, 8)'" onmouseout="this.style.color='rgb(255, 255, 255)'">Our Services</a>
                      <a href="/pricing" class="text-white hover:text-orange-400 transition-colors duration-200 px-3 py-2 rounded-md font-display text-xl" style="color: rgb(255, 255, 255);" onmouseover="this.style.color='rgb(255, 127, 8)'" onmouseout="this.style.color='rgb(255, 255, 255)'">Pricing</a>
                      <a href="/team" class="text-white hover:text-orange-400 transition-colors duration-200 px-3 py-2 rounded-md font-display text-xl" style="color: rgb(255, 255, 255);" onmouseover="this.style.color='rgb(255, 127, 8)'" onmouseout="this.style.color='rgb(255, 255, 255)'">Our team</a>
                      <a href="/contact" class="text-white hover:text-orange-400 transition-colors duration-200 px-3 py-2 rounded-md font-display text-xl" style="color: rgb(255, 255, 255);" onmouseover="this.style.color='rgb(255, 127, 8)'" onmouseout="this.style.color='rgb(255, 255, 255)'">Contact Us</a>
                    </div>
                  </div>
                </div>

                <div class="hidden sm:ml-6 sm:block">
                  <div class="ml-4 flex items-center">
                    <div class="ml-3 relative">
                      <div class="inline-flex rounded-md" role="group">
                        <a href="tel:+15039314045" class="py-2 text-xl px-4 text-white font-display" style="color: rgb(255, 255, 255);" onmouseover="this.style.color='rgb(255, 127, 8)'" onmouseout="this.style.color='rgb(255, 255, 255)'">(503) 931-4045</a>
                        <a href="tel:+15039314045" class="p-1 py-2 px-4 text-white" style="color: rgb(255, 255, 255);" onmouseover="this.style.color='rgb(255, 127, 8)'" onmouseout="this.style.color='rgb(255, 255, 255)'">
                          <span class="sr-only">Telephone Us</span>
                          <svg class="h-7 w-7" fill="white" viewBox="0 0 473.806 473.806" aria-hidden="true">
                            <path d="M374.456,293.506c-9.7-10.1-21.4-15.5-33.8-15.5c-12.3,0-24.1,5.3-34.2,15.4l-31.6,31.5c-2.6-1.4-5.2-2.7-7.7-4c-3.6-1.8-7-3.5-9.9-5.3c-29.6-18.8-56.5-43.3-82.3-75c-12.5-15.8-20.9-29.1-27-42.6c8.2-7.5,15.8-15.3,23.2-22.8c2.8-2.8,5.6-5.7,8.4-8.5c21-21,21-48.2,0-69.2l-27.3-27.3c-3.1-3.1-6.3-6.3-9.3-9.5c-6-6.2-12.3-12.6-18.8-18.6c-9.7-9.6-21.3-14.7-33.5-14.7s-24,5.1-34,14.7c-0.1,0.1-0.1,0.1-0.2,0.2l-34,34.3c-12.8,12.8-20.1,28.4-21.7,46.5c-2.4,29.2,6.2,56.4,12.8,74.2c16.2,43.7,40.4,84.2,76.5,127.6c43.8,52.3,96.5,93.6,156.7,122.7c23,10.9,53.7,23.8,88,26c2.1,0.1,4.3,0.2,6.3,0.2c23.1,0,42.5-8.3,57.7-24.8c0.1-0.2,0.3-0.3,0.4-0.5c5.2-6.3,11.2-12,17.5-18.1c4.3-4.1,8.7-8.4,13-12.9c9.9-10.3,15.1-22.3,15.1-34.6c0-12.4-5.3-24.3-15.4-34.3L374.456,293.506z M410.256,398.806C410.156,398.806,410.156,398.906,410.256,398.806c-3.9,4.2-7.9,8-12.2,12.2c-6.5,6.2-13.1,12.7-19.3,20c-10.1,10.8-22,15.9-37.6,15.9c-1.5,0-3.1,0-4.6-0.1c-29.7-1.9-57.3-13.5-78-23.4c-56.6-27.4-106.3-66.3-147.6-115.6c-34.1-41.1-56.9-79.1-72-119.9c-9.3-24.9-12.7-44.3-11.2-62.6c1-11.7,5.5-21.4,13.8-29.7l34.1-34.1c4.9-4.6,10.1-7.1,15.2-7.1c6.3,0,11.4,3.8,14.6,7c0.1,0.1,0.2,0.2,0.3,0.3c6.1,5.7,11.9,11.6,18,17.9c3.1,3.2,6.3,6.4,9.5,9.7l27.3,27.3c10.6,10.6,10.6,20.4,0,31c-2.9,2.9-5.7,5.8-8.6,8.6c-8.4,8.6-16.4,16.6-25.1,24.4c-0.2,0.2-0.4,0.3-0.5,0.5c-8.6,8.6-7,17-5.2,22.7c0.1,0.3,0.2,0.6,0.3,0.9c7.1,17.2,17.1,33.4,32.3,52.7l0.1,0.1c27.6,34,56.7,60.5,88.8,80.8c4.1,2.6,8.3,4.7,12.3,6.7c3.6,1.8,7,3.5,9.9,5.3c0.4,0.2,0.8,0.5,1.2,0.7c3.4,1.7,6.6,2.5,9.9,2.5c8.3,0,13.5-5.2,15.2-6.9l34.2-34.2c3.4-3.4,8.8-7.5,15.1-7.5c6.2,0,11.3,3.9,14.4,7.3c0.1,0.1,0.1,0.1,0.2,0.2l55.1,55.1C420.456,377.706,420.456,388.206,410.256,398.806z"/>
                          </svg>
                        </a>
                        <a href="mailto:michael@mtg-consulting.net" class="py-2 px-4 text-white" style="color: rgb(255, 255, 255);" onmouseover="this.style.color='rgb(255, 127, 8)'" onmouseout="this.style.color='rgb(255, 255, 255)'">
                          <span class="sr-only">Email Us</span>
                          <svg class="h-7 w-7" fill="white" viewBox="0 0 54.1 54.1" aria-hidden="true">
                            <path fill="white" d="M14.241,18.4c3.754,2.568,7.761,4.558,11.872,6.464c6.938-2.519,13.185-5.886,19.438-9.408c2.351-1.325,4.713-2.664,7.107-3.993c-2.977-2.531-11.679-1.219-14.154-1.219c-7.089,0.01-14.176,0-21.275-0.01c-2.05-0.122-4.19-0.174-6.189,0.01H8.896c-1.436,0.007-3.418-0.117-5.006,0.408c2.233,1.421,4.267,3.08,6.326,4.719C11.526,16.413,12.848,17.446,14.241,18.4z"/>
                            <path fill="white" d="M11.406,20.105c-3.33-2.417-6.32-5.187-9.86-7.298c-0.617,1.664-0.282,3.875-0.492,5.422c-0.009,0.061,0.011,0.112,0.011,0.163c-0.643,2.744-0.643,5.752-0.715,8.404c-0.073,2.57-0.613,6.271-0.188,9.468c-0.039,1.539-0.054,3.155,0.283,4.508c6.607-5.211,13.631-10.385,20.712-14.902C17.772,24.189,14.505,22.354,11.406,20.105z"/>
                            <path fill="white" d="M53.884,20.758c0.112-2.091,0.399-4.383,0.044-6.505c-6.632,3.681-12.99,7.452-19.807,10.593c3.883,3.246,7.842,6.352,11.729,9.555c1.641,1.352,3.268,2.725,4.871,4.133c0.581,0.509,1.155,1.027,1.728,1.548c0.176-0.348,0.338-0.713,0.465-1.12c0.715-2.251,0.427-4.944,0.251-7.444c0.023-0.549,0.049-1.101,0.075-1.655C53.437,26.83,53.725,23.806,53.884,20.758z"/>
                            <path fill="white" d="M31.06,26.188c-1.508,0.635-3.035,1.249-4.607,1.808c-0.579,0.206-1.054,0.062-1.38-0.254c-0.244-0.113-0.488-0.229-0.731-0.343c-0.094,0.099-0.197,0.192-0.327,0.273C16.54,32.346,9.06,37.833,2.109,43.331c0.608,0.388,1.395,0.623,2.427,0.635c4.545,0.055,9.098,0.021,13.65-0.022C26.056,44.156,33.94,44,41.808,44.185c3.041,0.069,6.359-0.134,8.658-1.776c-6.157-5.604-12.762-10.553-19.125-15.911C31.224,26.4,31.137,26.295,31.06,26.188z"/>
                          </svg>
                        </a>
                        <a href="/bio">
                          <button type="button" class="rounded-sm flex items-center text-sm focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-800 focus:ring-white" id="user-menu-button" aria-expanded="false">
                            <span class="sr-only">Open user menu</span>
                            <img class="h-14 w-14 rounded-full" src="/images/michaelsq.png?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80" alt="cigar mike">
                          </button>
                        </a>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="-mr-2 flex sm:hidden">
                  <button type="button" class="relative inline-flex items-center justify-center" @click="open = !open" aria-controls="mobile-menu" aria-expanded="open">
                    <span class="absolute -inset-0.5"></span>
                    <span class="sr-only">Open main menu</span>
                    <svg class="block size-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true" data-slot="icon">
                      <path x-show="!open" stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
                    </svg>
                    <svg class="hidden size-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true" data-slot="icon">
                      <path x-show="open" stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
                    </svg>
                  </button>
                </div>
              </div>
            </div>
        
            <!-- Mobile menu -->
            <div class="sm:hidden" id="mobile-menu" x-show="open">
              <div class="space-y-1 px-2 pt-2 pb-3">
                <a href="/articles" class="block rounded-md px-3 py-2 text-xl font-medium text-white" style="color: rgb(255, 255, 255);" onmouseover="this.style.color='rgb(255, 127, 8)'" onmouseout="this.style.color='rgb(255, 255, 255)'">Our Services</a>
                <a href="/pricing" class="block rounded-md px-3 py-2 text-xl font-medium text-white" style="color: rgb(255, 255, 255);" onmouseover="this.style.color='rgb(255, 127, 8)'" onmouseout="this.style.color='rgb(255, 255, 255)'">Pricing</a>
                <a href="/team" class="block rounded-md px-3 py-2 text-xl font-medium text-white" style="color: rgb(255, 255, 255);" onmouseover="this.style.color='rgb(255, 127, 8)'" onmouseout="this.style.color='rgb(255, 255, 255)'">Our team</a>
                <a href="/contact" class="block rounded-md px-3 py-2 text-xl font-medium text-white" style="color: rgb(255, 255, 255);" onmouseover="this.style.color='rgb(255, 127, 8)'" onmouseout="this.style.color='rgb(255, 255, 255)'">Contact Us</a>
                <a href="mailto:michael@mtg-consulting.net" class="block rounded-md px-3 py-2 text-xl font-medium text-white" style="color: rgb(255, 255, 255);" onmouseover="this.style.color='rgb(255, 127, 8)'" onmouseout="this.style.color='rgb(255, 255, 255)'">Email Us</a>
              </div>
            </div>
          </nav>
        </div>

        <%= @inner_content %>
        
        <!-- Footer -->
        <footer style="background-color: rgb(29, 9, 89);" class="text-white py-12">
          <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between items-center">
              
              <!-- Logo and Home Link -->
              <div>
                <a href="/" class="inline-block">
                  <img height="60" width="200" class="h-[60px] w-auto" src="/images/mtglogo.jpg" alt="MTG Consulting Logo">
                </a>
              </div>

              <!-- Center Engagement Terms Link -->
              <div class="absolute left-1/2 transform -translate-x-1/2">
                <a href="/engagement" class="text-gray-300 hover:text-orange-400 transition-colors duration-200 text-base">
                  Engagement Terms
                </a>
              </div>

              <!-- Right Side Email Button -->
              <div>
                <a href="mailto:michael@mtg-consulting.net" class="bg-gradient-to-r from-orange-500 to-orange-600 hover:from-orange-600 hover:to-orange-700 text-white font-semibold py-2 px-4 rounded-full transition-all duration-200 text-sm">
                  Email Us
                </a>
              </div>
            </div>

            <!-- Bottom Footer -->
            <div class="border-t border-gray-600 mt-8 pt-6 text-center">
              <p class="text-gray-400 text-sm">&copy; 2025 MTG Consulting. All rights reserved.</p>
            </div>
          </div>
        </footer>
      </body>
    </html>
    """
  end

  # Manual function to render app layout
  def app(assigns) do
    ~H"""
    <main class="text-white" style="background-color: rgb(29, 9, 89); min-height: calc(100vh - 200px);">
      <p class="alert alert-info" role="alert" :if={Phoenix.Flash.get(@flash, :info)}><%= Phoenix.Flash.get(@flash, :info) %></p>
      <p class="alert alert-danger" role="alert" :if={Phoenix.Flash.get(@flash, :error)}><%= Phoenix.Flash.get(@flash, :error) %></p>
      <%= @inner_content %>
    </main>
    """
  end
end