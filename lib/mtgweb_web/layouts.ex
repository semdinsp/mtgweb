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
        <!-- Font optimization: preload critical fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        
        <link phx-track-static rel="stylesheet" href={~p"/assets/app.css?v=2"}/>
        <script defer phx-track-static type="text/javascript" src={~p"/assets/app.js"}></script>
        <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
        <link rel="icon" type="image/x-icon" href="/favicon.ico" />

        <script defer src="https://unpkg.com/alpinejs@3.14.9/dist/cdn.min.js"></script>
      </head>
      <body data-theme="mtg" style="background-color: rgb(29, 9, 89); min-height: 100vh;">
        <div class="min-h-full" style="background-color: rgb(29, 9, 89)">
          <nav class="bg-mtg-purple" x-data="{ open: true }">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
              <div class="flex items-center justify-between h-16">
                <!-- Left side - Logo and primary navigation -->
                <div class="flex items-center">
                  <!-- Logo/Icon -->
                  <div class="shrink-0">
                    <a href="/">
                      <img height="60" width="200" class="h-[60px] w-auto" src="/images/mtglogo.jpg" alt="MTG Logo">
                    </a>
                  </div>
                  
                  <!-- Primary Navigation (Left side) -->
                  <div class="hidden sm:ml-8 sm:block">
                    <div class="flex items-baseline space-x-6">
                      <a href="/" class="text-white hover:text-orange-400 transition-colors duration-200 px-3 py-2 rounded-md font-display text-xl" style="color: rgb(255, 255, 255);" onmouseover="this.style.color='rgb(255, 127, 8)'" onmouseout="this.style.color='rgb(255, 255, 255)'">Home</a>
                      <a href="/articles" class="text-white hover:text-orange-400 transition-colors duration-200 px-3 py-2 rounded-md font-display text-xl" style="color: rgb(255, 255, 255);" onmouseover="this.style.color='rgb(255, 127, 8)'" onmouseout="this.style.color='rgb(255, 255, 255)'">Our Services</a>
                      <a href="/pricing" class="text-white hover:text-orange-400 transition-colors duration-200 px-3 py-2 rounded-md font-display text-xl" style="color: rgb(255, 255, 255);" onmouseover="this.style.color='rgb(255, 127, 8)'" onmouseout="this.style.color='rgb(255, 255, 255)'">Pricing</a>
                    </div>
                  </div>
                </div>

                <!-- Right side - Secondary navigation and CTA -->
                <div class="hidden sm:flex sm:items-center sm:space-x-6">
                  <!-- Secondary Navigation -->
                  <div class="flex items-baseline space-x-6">
                    <a href="/team" class="text-white hover:text-orange-400 transition-colors duration-200 px-3 py-2 rounded-md font-display text-xl" style="color: rgb(255, 255, 255);" onmouseover="this.style.color='rgb(255, 127, 8)'" onmouseout="this.style.color='rgb(255, 255, 255)'">Our Team</a>
                    <a href="/contact" class="text-white hover:text-orange-400 transition-colors duration-200 px-3 py-2 rounded-md font-display text-xl" style="color: rgb(255, 255, 255);" onmouseover="this.style.color='rgb(255, 127, 8)'" onmouseout="this.style.color='rgb(255, 255, 255)'">Contact Us</a>
                  </div>
                  
                  <!-- CTA Button -->
                  <div class="ml-6">
                    <a href="/contact" class="bg-gradient-to-r from-orange-500 to-orange-600 hover:from-orange-600 hover:to-orange-700 text-white font-semibold py-2 px-6 rounded-full transition-all duration-200 text-sm shadow-lg hover:shadow-xl transform hover:scale-105">
                      Get Started
                    </a>
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
                <a href="/" class="block rounded-md px-3 py-2 text-xl font-medium text-white" style="color: rgb(255, 255, 255);" onmouseover="this.style.color='rgb(255, 127, 8)'" onmouseout="this.style.color='rgb(255, 255, 255)'">Home</a>
                <a href="/articles" class="block rounded-md px-3 py-2 text-xl font-medium text-white" style="color: rgb(255, 255, 255);" onmouseover="this.style.color='rgb(255, 127, 8)'" onmouseout="this.style.color='rgb(255, 255, 255)'">Our Services</a>
                <a href="/pricing" class="block rounded-md px-3 py-2 text-xl font-medium text-white" style="color: rgb(255, 255, 255);" onmouseover="this.style.color='rgb(255, 127, 8)'" onmouseout="this.style.color='rgb(255, 255, 255)'">Pricing</a>
                <a href="/team" class="block rounded-md px-3 py-2 text-xl font-medium text-white" style="color: rgb(255, 255, 255);" onmouseover="this.style.color='rgb(255, 127, 8)'" onmouseout="this.style.color='rgb(255, 255, 255)'">Our Team</a>
                <a href="/contact" class="block rounded-md px-3 py-2 text-xl font-medium text-white" style="color: rgb(255, 255, 255);" onmouseover="this.style.color='rgb(255, 127, 8)'" onmouseout="this.style.color='rgb(255, 255, 255)'">Contact Us</a>
                <a href="/contact" class="block rounded-md px-3 py-2 text-xl font-medium bg-gradient-to-r from-orange-500 to-orange-600 text-white">Get Started</a>
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