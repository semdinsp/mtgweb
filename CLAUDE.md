# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Core Development
- `mix deps.get` - Install dependencies
- `mix phx.server` - Start Phoenix development server (localhost:4000)
- `mix test` - Run tests
- `mix credo` - Run code analysis (static code analysis tool)

### Database (Note: Database disabled in this project)
- Database operations are commented out in mix.exs
- No Ecto repo is started in application.ex
- Use `mix ecto.setup`, `mix ecto.migrate` if database is re-enabled

### Asset Management
- `mix assets.deploy` - Build and minify assets for production (runs Tailwind and esbuild)
- Assets are built with esbuild (JavaScript) and Tailwind CSS v4.0
- Frontend uses Alpine.js for JavaScript interactions

### Deployment
- `fly deploy` - Deploy to Fly.io production
- Domain: mtg-consulting.net (via Netlify)

## Architecture Overview

### Application Structure
This is a Phoenix 1.6 LiveView application for MTG Consulting's website that operates without a traditional database, instead using Airtable as a headless CMS.

### Key Components

**Airtable Integration**
- `Mtgweb.AirtableRepo` - Repository pattern for Airtable API with caching
- `Services.Airtable` - Airtable service configuration
- Uses Tesla HTTP client with Hackney adapter
- Implements caching via `Mtgweb.Article.Cache` and `Mtgweb.Content.Cache`

**LiveView Pages**
- `MtgwebWeb.PageLive` - Main homepage with dynamic content sections
- `MtgwebWeb.ArticlesLive` - Articles listing page
- `MtgwebWeb.ShowArticleLive` - Individual article display
- Uses Phoenix.LiveView for real-time updates

**Content Management**
- Content is fetched from Airtable and cached in memory
- Content types: Articles, Content sections (hero, features, testimonials)
- `MtgwebWeb.LiveEncoder` - Transforms Airtable data for LiveView rendering

**Routing Structure**
- `/` - Homepage (LiveView)
- `/articles` - Articles listing (LiveView) 
- `/articles/:id/:slug` - Individual articles (LiveView)
- `/pricing`, `/contact`, `/team`, `/bio`, `/terms` - Static pages

### Notable Patterns
- Repository pattern with adapter abstraction for data sources
- In-memory caching for external API responses
- Content-driven architecture using Airtable as headless CMS
- LiveView for dynamic content rendering with real-time updates
- Uses Phoenix.PubSub for content update notifications

### Design System & Styling
- **Color Scheme**: Purple/blue theme inspired by Framer design
  - Primary background: `rgb(29, 9, 89)` (main purple)
  - Secondary background: `rgb(24, 7, 74)` (darker purple for cards)
  - Accent color: `rgb(255, 127, 8)` (orange for buttons and highlights)
  - Text: White for readability on purple backgrounds
- **Typography**: Uses Inter font family (Inter, Inter Tight, Inter Display, Playfair Display)
- **DaisyUI Integration**: Configured with custom MTG theme
- **Hover Effects**: Orange color transitions on navigation and interactive elements

### Recent Updates (Design System Implementation)
- **Global Background**: All pages use purple background `rgb(29, 9, 89)`
- **Header Navigation**: 50% larger fonts, orange hover effects, modern logo with gradients
- **Homepage**: Updated hero section, pricing cards, testimonials with purple/orange theme
- **Pricing Page**: Fully redesigned with purple backgrounds and orange accents
- **Team Page**: Updated with purple background and orange social link colors
- **Components**: Pricing cards use darker purple `rgb(24, 7, 74)` with orange borders

### Configuration Notes
- Airtable credentials are in config/config.exs (should be moved to runtime config)
- Tailwind CSS v4.0 configured with custom plugins and DaisyUI
- Custom color palette defined in tailwind.config.js
- No database - Ecto components are commented out
- Tesla configured for HTTP client with Hackney adapter