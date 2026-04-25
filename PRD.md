# FlutMan Flutter UI Library

## Product Requirements Document (PRD)

```
Product Name: FlutMan Flutter UI Library
Version: v0.1 (MVP)
Document Date: April 25, 2026
Author: ZeroFounder / FlutMan
Status: Draft
```

---

## 1. PROJECT OVERVIEW

### What is this?

FlutMan Flutter UI Library হলো Flutter developers দের জন্য একটি copy-paste UI component library, যা shadcn/ui এর philosophy follow করে। এটি একটি zero-dependency approach নিয়েছে - কোনো ভারী pub.dev package নির্ভরশীলতা ছাড়াই developers সরাসরি CLI tool ব্যবহার করে তাদের Flutter project এ components add করতে পারবে। বর্তমান FlutMan React UI library এর পাশাপাশি এটি একটি parallel Flutter ecosystem তৈরি করবে।

### Why are we building this?

**Problem Statement:**
- Flutter ecosystem এ shadcn/ui এর মতো একটি lightweight, copy-paste friendly UI library নেই
- বেশিরভাগ Flutter UI libraries ভারী এবং অনেক dependencies নিয়ে আসে
- Indie hackers এবং solo developers দ্রুত Flutter projects launch করতে চায়, কিন্তু UI development time বেশি লাগে
- Cross-platform consistency maintain করা কঠিন হয়ে পড়ে যখন React web এবং Flutter mobile দুটোই একই design language follow করে

**Solution:**
- shadcn/ui এর মতো copy-paste model - কোড নিজের project এ রাখো, customize করো
- Zero pub.dev dependency - শুধু Dart code, কোনো third-party package নয়
- CLI tool দিয়ে এক command এ component fetch এবং add করা যায়
- FlutMan এর existing design system (colors, layout, tokens) Flutter এ port করা

### Who is this for?

**Primary User Persona:**

| Attribute | Description |
|-----------|-------------|
| Role | Indie hackers, solo developers, startup founders |
| Tech Comfort | Intermediate Flutter developers |
| Context | MVPs এবং production apps দ্রুত বানাতে চায় |
| Geographic | Tier-1 cities (Bangladesh: Dhaka, Chattogram) এবং global indie devs |
| Pain Point | Beautiful UI দ্রুত বানাতে চায়, কিন্তু time নেই |

### Business Model

**Freemium Model:**

| Tier | Features |
|------|----------|
| **Free** | All basic components (50+), open source, CLI access |
| **Premium** | Complete SaaS boilerplates (Auth + Payment + Supabase), priority support |

**Revenue Logic:**
- Users free components দিয়ে habituated হয়
- যখন serious project বানায়, তখন premium boilerplates কিনে সময় বাঁচায়
- One-time purchase model (not subscription) - indie devs prefer করে

### Success Metrics

| Metric | Target (MVP) |
|--------|--------------|
| CLI Downloads | 1,000+ in first 3 months |
| Components Available | 30+ at launch |
| GitHub Stars | 500+ on Flutter repo |
| Active Users | 200+ monthly active CLI users |
| Premium Conversion | 5% of active users |

---

## 2. SCOPE & CONSTRAINTS

### In Scope (MVP)

- **Flutter Component Registry** - `registry/flutter/` folder structure
- **10 Core Components** at minimum viable launch:
  - Button, Input, Card, Dialog, Avatar, Badge, Alert, Toast, Select, Checkbox
- **Dart CLI Tool** - `flutman` command line interface
- **Supabase Integration** - ComponentRegistry table with metadata
- **GitHub Actions Pipeline** - Auto-sync on push to main
- **Documentation Site** - Fumadocs-based docs (using existing Next.js shell)
- **Component Preview** - Web-based Flutter widget preview (if feasible)

### Out of Scope (v1+)

- Premium boilerplates (post-MVP - see Premium Strategy below)
- Custom theme builder web interface
- VS Code extension
- IntelliJ/Android Studio plugin
- 50+ components (MVP শেষে gradually add)
- AI-generated components
- Community contribution portal

### Premium Paywall Strategy (Freemium Roadmap)

**Free Tier (100% Open Source):**

| Category | Components | Access |
|----------|-----------|--------|
| **Inputs** | Button, Input, Checkbox, Radio, Select, Switch, Slider | `flutman add [name]` |
| **Display** | Card, Avatar, Badge, Alert, Progress, Skeleton | `flutman add [name]` |
| **Feedback** | Toast, Dialog, Tooltip | `flutman add [name]` |
| **Layout** | Divider, Spacer, Stack utilities | `flutman add [name]` |
| **Navigation** | Tab, BottomNav, AppBar | `flutman add [name]` |

**Total Free:** 20+ components (MVP: 10, Month 2-3: 20+)

**Premium Tier (Paid Boilerplates):**

| Package | Components Included | Price | Access |
|---------|-------------------|-------|--------|
| **Auth Kit** | Complete auth flow: LoginScreen, RegisterScreen, ForgotPassword, OTPVerification, SocialLogin, AuthWrapper | $49 | `flutman add auth-kit --token=XXX` |
| **Payment Kit** | Stripe/Razorpay integration: PaymentScreen, CardInput, CheckoutFlow, SubscriptionManager, InvoiceHistory | $49 | `flutman add payment-kit --token=XXX` |
| **Admin Dashboard** | Data visualization: ChartCard, StatsGrid, DataTable, FilterBar, ExportButton, DateRangePicker | $69 | `flutman add admin-kit --token=XXX` |
| **E-commerce Kit** | Shopping UI: ProductCard, CartScreen, CheckoutFlow, OrderTracking, Wishlist, ReviewSection | $69 | `flutman add ecommerce-kit --token=XXX` |
| **Complete SaaS** | Auth + Payment + Admin + 10 premium components | $149 (bundle) | `flutman add saas-starter --token=XXX` |

**Premium Component Examples:**

```dart
// Auth Kit - LoginScreen
class LoginScreen extends StatelessWidget {
  final VoidCallback? onGoogleSignIn;
  final VoidCallback? onAppleSignIn;
  final Future<bool> Function(String email, String password)? onEmailLogin;
  final bool enableSocialAuth;
  final bool enableForgotPassword;
  
  // Complete, production-ready login UI
}

// Payment Kit - CardInput
class PaymentCardInput extends StatefulWidget {
  final Function(PaymentCard) onCardValidated;
  final bool showCardIcons;
  final String? stripePublishableKey;
  
  // PCI-compliant UI (no actual storage)
}
```

**Authentication Flow (Premium):**

```bash
# User buys from website (Gumroad/LemonSqueezy)
# Receives license key via email

flutman auth login
# Opens browser: https://flutman.vercel.app/auth/callback
# User pastes license key
# CLI stores token: ~/.flutman/token

flutman add auth-kit
# API validates token
# Downloads premium component
# Shows: ✓ Premium component installed (Auth Kit)
```

**Database Schema (Premium):**

```sql
-- Add to existing ComponentRegistry table
ALTER TABLE ComponentRegistry ADD COLUMN tier TEXT DEFAULT 'free';
-- Values: 'free', 'premium', 'bundle-only'

-- License tracking
CREATE TABLE Licenses (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email           TEXT NOT NULL,
    license_key     TEXT UNIQUE NOT NULL,
    tier            TEXT NOT NULL,  -- 'auth-kit', 'payment-kit', 'saas-starter'
    purchase_date   TIMESTAMPTZ DEFAULT now(),
    expiry_date     TIMESTAMPTZ,    -- NULL = lifetime
    is_active       BOOLEAN DEFAULT true,
    downloads_count INTEGER DEFAULT 0
);
```

**Monetization Timeline:**

| Phase | Timeline | Action |
|-------|----------|--------|
| **Phase 1** | Month 1-3 | All components free, build user base |
| **Phase 2** | Month 4 | Launch Auth Kit ($49) |
| **Phase 3** | Month 5 | Launch Payment Kit ($49) |
| **Phase 4** | Month 6 | Launch bundles (SaaS Starter $149) |
| **Phase 5** | Month 7+ | More kits based on demand |

**Marketing Strategy:**
- Free components = Word of mouth + GitHub stars
- Premium kits = "Time saved" value proposition
- Target: Solo developers who value time over $49
- Distribution: Twitter/X, Reddit r/flutterdev, Product Hunt

### Constraints

| Constraint | Value |
|------------|-------|
| Budget | Zero Dollar - free tiers only (Supabase free, Vercel free) |
| Timeline | 30-day MVP |
| Team | Solo developer (1 person) |
| Platform | Flutter (Dart), Web (Next.js for docs) |
| Dependencies | Zero pub.dev packages for components |
| Existing Code | Next.js frontend 100% untouched |

---

## 3. PROJECT STRUCTURE

```
FluttMan-Flutter-UI-Library/           # Monorepo root
│
├── apps/
│   ├── ui/                            # [UNCHANGED] Next.js docs site
│   │   ├── app/                       # Fumadocs app router
│   │   ├── components/                # Existing React components
│   │   ├── content/                   # MDX docs content
│   │   ├── registry/                  # [EXTENDED] Now has flutter/ subfolder
│   │   │   ├── default/               # [UNCHANGED] React components
│   │   │   └── flutter/               # [NEW] Flutter components
│   │   │       ├── button/
│   │   │       │   ├── button.dart    # Raw Flutter code
│   │   │       │   └── button.mdx     # Fumadocs documentation
│   │   │       ├── input/
│   │   │       │   ├── input.dart
│   │   │       │   └── input.mdx
│   │   │       └── [component]/
│   │   │           ├── [name].dart
│   │   │           └── [name].mdx
│   │   └── package.json
│   │
│   └── flutter_cli/                     # [NEW] Dart CLI tool
│       ├── bin/
│       │   └── flutman.dart           # CLI entry point
│       ├── lib/
│       │   ├── commands/
│       │   │   ├── add_command.dart   # `flutman add` logic
│       │   │   ├── list_command.dart  # `flutman list` logic
│       │   │   └── init_command.dart  # `flutman init` logic
│       │   ├── services/
│       │   │   ├── api_service.dart   # Supabase API calls
│       │   │   └── file_service.dart  # Local file operations
│       │   ├── models/
│       │   │   └── component.dart     # Component data model
│       │   └── utils/
│       │       ├── constants.dart     # URLs, paths
│       │       └── logger.dart        # Console output styling
│       ├── pubspec.yaml               # CLI dependencies
│       └── README.md
│
├── packages/
│   └── ui/                            # [UNCHANGED] React UI package
│       └── src/
│
├── .github/
│   └── workflows/
│       └── flutter-sync.yml           # [NEW] Auto-sync script trigger
│
├── scripts/
│   └── flutter-registry-sync.ts       # [NEW] TS parser & sync script
│       # Parses .dart files + .mdx metadata
│       # Syncs to Supabase ComponentRegistry table
│
├── supabase/
│   └── migrations/
│       └── 001_component_registry.sql # [NEW] DB schema
│
├── README.md                          # [UNCHANGED] Root readme
├── PRD.md                             # This document
└── idea.md                            # Original concept
```

---

## 4. USER FLOW

### Developer Journey (CLI User)

```
[Step 1] → Discovery
User দেখছে: FlutMan documentation site (flutman.vercel.app)
User পড়ছে: Flutter components section
User করছে: "Get Started" button এ click

[Step 2] → CLI Installation
User দেখছে: Installation instructions (dart pub global activate flutman)
User করছে: Terminal এ command run
System করছে: CLI globally install হচ্ছে

[Step 3] → Project Initialization
User করছে: cd their_flutter_project
User run করে: flutman init
System করছে:
  - flutman.yaml config file create
  - Check Supabase connection
  - Confirm components directory (default: lib/components/)

[Step 4] → Component Discovery
User run করে: flutman list
System করছে:
  - Fetch all available components from Supabase
  - Display: Name | Category | Dependencies | Install count
  - Show: 10 components available (MVP)

[Step 5] → Component Addition
User run করে: flutman add button
System করছে:
  - Fetch button.dart from Supabase
  - Create lib/components/flutman_button.dart
  - Display dependencies (if any)
  - Show success message with import statement

[Step 6] → Usage in Project
User দেখছে: Component file added
User পড়ছে: Generated usage example in comments
User করছে: Import এবং use করছে widget tree এ
```

### Documentation Site User (Web)

```
[Step 1] → Landing
User দেখছে: Existing FlutMan React UI docs (100% unchanged)
User করে: Flutter tab এ click (new addition)

[Step 2] → Component Browsing
User দেখছে: Fumadocs-rendered MDX content from registry/flutter/
User দেখছে: 
  - Component preview (image/GIF, not live widget)
  - Code snippet from .dart file
  - Props/parameters table
  - Usage example

[Step 3] → CLI Command Copy
User করে: "Copy install command" button এ click
System করে: `flutman add [component]` clipboard এ copy

[Step 4] → Implementation
User যায়: Own Flutter project
User paste করে: Copied command
```

---

## 5. ADMIN FLOW

**Admin কে?** Founder নিজে (solo developer)

**Admin কী করতে পারবে?**

| Action | Method |
|--------|--------|
| Add new component | Create folder in `registry/flutter/[name]/` with `.dart` + `.mdx`, push to GitHub |
| Edit component | Edit files, push - auto-sync handles rest |
| Delete component | Remove folder, push |
| View analytics | Supabase dashboard (free tier) |
| Update CLI | Publish new version to pub.dev |

**Admin-specific access:**
- Direct Supabase dashboard access
- GitHub repo write access
- pub.dev publish rights for CLI package

---

## 6. FEATURE SPECIFICATIONS

### Feature: Flutter Component Registry

**Priority:** P0 (must-have)  
**Complexity:** Medium

#### What it does:

Filesystem-based registry যেখানে প্রতিটা Flutter component এর জন্য একটি folder থাকে। প্রতিটা folder এ দুটি file: `.dart` (raw code) এবং `.mdx` (documentation)। GitHub push এ automatic parsing এবং Supabase sync হয়।

#### User interaction:

**Developer (contributing components):**
```
registry/flutter/
├── button/
│   ├── button.dart     # Widget implementation
│   └── button.mdx      # Docs, props, examples
├── input/
│   ├── input.dart
│   └── input.mdx
```

**Content format (button.dart):**
```dart
import 'package:flutter/material.dart';

class FlutmanButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final FlutmanButtonVariant variant;
  
  const FlutmanButton({
    required this.label,
    this.onPressed,
    this.variant = FlutmanButtonVariant.primary,
  });
  
  @override
  Widget build(BuildContext context) {
    // Implementation
  }
}

enum FlutmanButtonVariant { primary, secondary, outline, ghost }
```

**Content format (button.mdx):**
```mdx
---
title: Button
description: Interactive button component with variants
category: inputs
dependencies: []
---

# Button

A button component with multiple variants and sizes.

## Usage

```dart
FlutmanButton(
  label: 'Click me',
  onPressed: () {},
  variant: FlutmanButtonVariant.primary,
)
```

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| label | String | required | Button text |
| onPressed | VoidCallback? | null | Click handler |
| variant | FlutmanButtonVariant | primary | Visual style |
```

#### Business logic:

1. **GitHub Actions Trigger:** Push to `main` branch এ `registry/flutter/` change detect করে
2. **TS Parser Script:**
   - সব `.dart` files read করে
   - Class names, constructors, parameters extract করে regex দিয়ে
   - `.mdx` frontmatter (YAML) parse করে
   - Combined data structure তৈরি করে
3. **Supabase Sync:**
   - `ComponentRegistry` table এ upsert operation
   - Existing components update, new ones insert, removed ones delete

#### Edge cases:

- Invalid Dart syntax - parser skip করে error log করে
- Missing `.mdx` file - placeholder doc generate করে
- Duplicate component names - last one wins, warning log
- Large files (>100KB) - skip with warning (shouldn't happen for UI components)

#### Acceptance criteria:

- [ ] Push to main triggers sync within 2 minutes
- [ ] Parser correctly extracts all public classes from `.dart` files
- [ ] All `registry/flutter/` components appear in Supabase
- [ ] Failed parses don't break entire sync (individual error handling)
- [ ] Sync logs available in GitHub Actions output

---

### Feature: Dart CLI Tool (flutman)

**Priority:** P0 (must-have)  
**Complexity:** High

#### What it does:

Developers টার্মিনাল থেকে `flutman` command দিয়ে components discover, add, এবং manage করতে পারে। CLI Supabase API call করে component fetch করে এবং local Flutter project এ file write করে।

#### User interaction:

**Commands:**

```bash
# Install CLI
dart pub global activate flutman_cli

# Initialize in project
flutman init
# Output: ✓ Created flutman.yaml
#         ✓ Connected to Supabase
#         ✓ Components directory: lib/components/

# List available components
flutman list
# Output:
# ┌─────────────┬────────────┬─────────────────┐
# │ Name        │ Category   │ Dependencies    │
# ├─────────────┼────────────┼─────────────────┤
# │ button      │ inputs     │ none            │
# │ input       │ inputs     │ none            │
# │ card        │ display    │ none            │
# │ dialog      │ overlay    │ animations      │
# └─────────────┴────────────┴─────────────────┘

# Add component
flutman add button
# Output: ✓ Added lib/components/flutman_button.dart
#         ℹ Import: import 'components/flutman_button.dart';
#         ℹ Usage: FlutmanButton(label: 'Press me', onPressed: () {})

# Add multiple
flutman add button input card

# Search
flutman search "input"
```

**flutman.yaml config:**
```yaml
project:
  name: my_app
  
flutman:
  components_dir: lib/components/
  base_url: https://flutman.vercel.app
  
supabase:
  url: https://xxxx.supabase.co
  anon_key: xxxxxx
```

#### Business logic:

1. **Init Command:**
   - Check if `pubspec.yaml` exists (Flutter project validation)
   - Create `flutman.yaml` with defaults
   - Test Supabase connection
   - Create components directory

2. **List Command:**
   - GET `/rest/v1/ComponentRegistry?select=*`
   - Parse JSON response
   - Table format এ render

3. **Add Command:**
   - GET `/rest/v1/ComponentRegistry?name=eq.{name}`
   - Extract `code` field (raw Dart code)
   - Write to `{components_dir}/flutman_{name}.dart`
   - Generate import path
   - Show usage example

4. **Error Handling:**
   - Network error: Retry with exponential backoff (3 attempts)
   - Component not found: Suggest similar names (fuzzy match)
   - File already exists: Prompt overwrite/skip

#### Edge cases:

- No internet connection: Cache previous component list, inform user
- Component name typo: Suggest closest match ("Did you mean: button?")
- File permission error: Clear error message with fix suggestion
- Already added component: Check file existence, prompt for overwrite

#### Error Handling Specifications (Comprehensive)

**E1: Flutter SDK Not Found**

```dart
// Detection: Run `flutter --version`, check exit code
if (flutterVersion.exitCode != 0) {
  print('''
❌ Flutter SDK not found

Possible causes:
  • Flutter not installed
  • PATH variable not configured
  • Flutter is installed but `flutter` command not in PATH

Fix:
  1. Install Flutter: https://docs.flutter.dev/get-started/install
  2. Add to PATH: export PATH="$PATH:/path/to/flutter/bin"
  3. Restart terminal

After fixing, run: flutman doctor
  ''');
  exit(1);
}
```

**E2: Outdated Flutter SDK**

```dart
// Detection: Parse `flutter --version`, check if < 3.0.0
final version = parseFlutterVersion();
if (version.major < 3) {
  print('''
⚠️  Flutter SDK outdated

Required: Flutter 3.0.0 or higher
Current: ${version.full}

Fix:
  flutter upgrade

Note: Flutman components use Flutter 3.0+ features (Material 3, etc.)
  ''');
  exit(1);
}
```

**E3: Not a Flutter Project (No pubspec.yaml)**

```dart
// Detection: Check for pubspec.yaml in current directory
if (!File('pubspec.yaml').existsSync()) {
  print('''
❌ Not a Flutter project

No pubspec.yaml found in current directory.

Possible causes:
  • You're not in a Flutter project root
  • Project structure is corrupted

Fix:
  cd /path/to/your/flutter_project
  # or
  flutter create my_app
  cd my_app
  flutman init
  ''');
  exit(1);
}
```

**E4: Invalid pubspec.yaml**

```dart
// Detection: Try to parse pubspec.yaml as YAML
try {
  final pubspec = loadYaml(File('pubspec.yaml').readAsStringSync());
  if (pubspec['name'] == null || pubspec['dependencies'] == null) {
    throw FormatException('Missing required fields');
  }
} catch (e) {
  print('''
❌ Invalid pubspec.yaml

Error: ${e.message}

Fix:
  1. Check pubspec.yaml syntax
  2. Run: flutter pub get (to validate)
  3. Fix any errors reported by Flutter
  ''');
  exit(1);
}
```

**E5: File Permission Denied**

```dart
// Detection: Try to write to components directory
try {
  File('lib/components/test.dart').writeAsStringSync('test');
  File('lib/components/test.dart').deleteSync();
} catch (e) {
  print('''
❌ Permission denied

Cannot write to: lib/components/

Possible causes:
  • Directory is read-only
  • You don't have write permissions
  • Directory owned by another user

Fix (macOS/Linux):
  sudo chown -R \$(whoami) lib/components/
  # or choose different directory:
  flutman init --dir=./my_components

Fix (Windows):
  Run terminal as Administrator
  # or choose different directory
  ''');
  exit(1);
}
```

**E6: Network/Supabase Connection Failed**

```dart
// Detection: HTTP request timeout or failure
if (response.statusCode == 0 || response.statusCode >= 500) {
  print('''
❌ Cannot connect to Flutman servers

Possible causes:
  • No internet connection
  • Firewall blocking connection
  • Supabase maintenance

Status: ${response.statusCode}

Fix:
  1. Check internet: ping flutman.vercel.app
  2. Check firewall settings
  3. Try again in a few minutes

Using cached component list (if available)...
  ''');
  // Fallback to cache, don't exit
  return loadFromCache();
}
```

**E7: Component Not Found**

```dart
// Detection: 404 from API
if (response.statusCode == 404) {
  final available = await getSimilarComponents(name);
  print('''
❌ Component "$name" not found

Did you mean:
${available.map((c) => '  • ${c.name}').join('\n')}

See all components:
  flutman list

Search:
  flutman search ${name.substring(0, 3)}
  ''');
  exit(1);
}
```

**Error Helper Command:**

```bash
flutman doctor
# Output:
# ✓ Flutter SDK: 3.19.0
# ✓ Project: Valid pubspec.yaml
# ✓ Permissions: Can write to lib/components/
# ✓ Network: Connected to Flutman API
# ✓ Cache: 10 components cached
```

#### Acceptance criteria:

- [ ] CLI installs globally via `dart pub global activate`
- [ ] `flutman init` creates valid config in Flutter project
- [ ] `flutman list` shows all components from Supabase
- [ ] `flutman add {name}` downloads and saves correct file
- [ ] Generated files are valid Dart (compile without errors)
- [ ] Help text available for all commands (`--help`)
- [ ] Exit codes: 0 success, 1 error, 2 partial success

---

### Feature: Auto-Sync Pipeline (GitHub Actions + TS Script)

**Priority:** P0 (must-have)  
**Complexity:** Medium

#### What it does:

GitHub repository এ push হলে automatic একটি pipeline trigger হয় যা TypeScript script রান করে। Scriptটি নতুন/পরিবর্তিত Flutter components detect করে, parse করে, এবং Supabase database এ sync করে।

#### User interaction:

**Developer (maintainer) perspective:**

```bash
# Local development
mkdir -p registry/flutter/toggle
vim registry/flutter/toggle/toggle.dart   # Add component code
vim registry/flutter/toggle/toggle.mdx    # Add docs
git add .
git commit -m "feat: add toggle component"
git push origin main

# GitHub Actions automatically:
# 1. Detects registry/flutter/ changes
# 2. Runs scripts/flutter-registry-sync.ts
# 3. Updates Supabase ComponentRegistry table
# 4. Posts success/failure comment to commit
```

**Workflow file (.github/workflows/flutter-sync.yml):**
```yaml
name: Flutter Registry Sync

on:
  push:
    branches: [main]
    paths:
      - 'registry/flutter/**'
      - 'scripts/flutter-registry-sync.ts'

jobs:
  sync:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v2
      - uses: actions/setup-node@v4
        with:
          node-version: '20'
      - run: pnpm install
      - run: pnpm ts-node scripts/flutter-registry-sync.ts
        env:
          SUPABASE_URL: ${{ secrets.SUPABASE_URL }}
          SUPABASE_SERVICE_KEY: ${{ secrets.SUPABASE_SERVICE_KEY }}
```

#### Business logic:

**Parser Script Logic (TypeScript):**

```typescript
// 1. Find all registry/flutter/* folders
const componentDirs = glob.sync('registry/flutter/*');

// 2. For each directory
for (const dir of componentDirs) {
  const name = path.basename(dir);
  
  // 3. Read .dart file
  const dartCode = fs.readFileSync(`${dir}/${name}.dart`, 'utf8');
  
  // 4. Parse Dart code (regex-based)
  const className = extractClassName(dartCode);     // FlutmanToggle
  const props = extractConstructorParams(dartCode); // [{name, type, required}]
  
  // 5. Read .mdx file
  const mdxContent = fs.readFileSync(`${dir}/${name}.mdx`, 'utf8');
  const frontmatter = parseFrontmatter(mdxContent); // title, description, category
  
  // 6. Build component object
  const component = {
    name,
    class_name: className,
    code: dartCode,
    description: frontmatter.description,
    category: frontmatter.category,
    dependencies: frontmatter.dependencies || [],
    props: props,
    updated_at: new Date().toISOString()
  };
  
  // 7. Upsert to Supabase
  await supabase.from('ComponentRegistry').upsert(component);
}
```

**Parser Implementation Details:**

- **Class Name Extraction:** Regex: `class\s+(\w+)\s+extends\s+(Stateless|Stateful)Widget`
- **Constructor Params:** Regex: `const\s+\w+\s*\(([^)]+)\)` then split by comma
- **Frontmatter:** `gray-matter` library (standard MDX frontmatter parser)

#### Edge cases:

- Syntax error in Dart file: Log error, skip component, continue others
- Missing .mdx: Use defaults (description = "", category = "general")
- Duplicate component names: Later ones override earlier (alphabetical)
- Supabase connection fail: Retry 3x, then fail workflow with error message
- Rate limiting: Supabase has 500 req/min limit on free tier, queue if needed

#### Acceptance criteria:

- [ ] Push triggers sync within 60 seconds
- [ ] Script correctly parses all 10 MVP components
- [ ] Database reflects current state of registry/flutter/ folder
- [ ] Failed components log errors but don't break whole sync
- [ ] Workflow status badge shows in README
- [ ] Manual trigger possible via `workflow_dispatch`

---

### Feature: Documentation Site Integration

**Priority:** P1 (important)  
**Complexity:** Low

#### What it does:

Existing Next.js + Fumadocs documentation site এ Flutter components section add করা হবে। UI 100% unchanged থাকবে - শুধু content structure extend হবে।

#### User interaction:

**Navigation:**
```
flutman.vercel.app
├── React Components (existing)
├── Particles (existing)
└── Flutter (new)              ← New tab in nav
    ├── Getting Started
    ├── Installation
    └── Components
        ├── Button
        ├── Input
        ├── Card
        └── ...
```

**Component Page Structure:**
```mdx
---
title: Button
description: A clickable button component
---

import { ComponentPreview } from '@/components/component-preview';

# Button

<ComponentPreview 
  name="button"
  platform="flutter"
  previewImage="/flutter-previews/button.png"
/>

## Installation

```bash
flutman add button
```

## Usage

```dart
import 'components/flutman_button.dart';

FlutmanButton(
  label: 'Press me',
  onPressed: () => print('Clicked!'),
)
```

## API Reference

| Prop | Type | Description |
|------|------|-------------|
| label | String | Button text |
| onPressed | VoidCallback? | Click handler |
```

#### Business logic:

1. **MDX Files:** `registry/flutter/[component]/[component].mdx` files automatically Fumadocs পড়ে
2. **Routing:** Fumadocs dynamic routing handle করে
3. **Preview:** Static images/GIFs (not live widgets - keep it simple for MVP)
4. **Search:** Fumadocs built-in search index এ Flutter components include করে

#### Edge cases:

- Missing preview image: Show placeholder
- Invalid MDX syntax: Build error with clear message
- Large MDX files: Lazy load code examples

#### Acceptance criteria:

- [ ] Flutter section visible in main nav
- [ ] All 10 MVP components have documentation pages
- [ ] Search works for Flutter components
- [ ] Mobile responsive (existing Fumadocs behavior)
- [ ] Code blocks have syntax highlighting (Dart)

---

## 7. DATABASE SCHEMA

### Supabase PostgreSQL Schema

```sql
-- ComponentRegistry table
-- Stores all Flutter components metadata and code
CREATE TABLE ComponentRegistry (
    id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name                TEXT UNIQUE NOT NULL,           -- e.g., "button"
    class_name          TEXT NOT NULL,                -- e.g., "FlutmanButton"
    description         TEXT DEFAULT '',              -- From MDX frontmatter
    category            TEXT DEFAULT 'general',       -- e.g., "inputs", "display"
    code                TEXT NOT NULL,                -- Raw .dart file content
    dependencies        TEXT[] DEFAULT '{}',          -- List of dependency names
    props               JSONB DEFAULT '[]',          -- Constructor parameters
    -- Example props structure:
    -- [
    --   {"name": "label", "type": "String", "required": true, "default": null},
    --   {"name": "onPressed", "type": "VoidCallback?", "required": false, "default": "null"}
    -- ]
    download_count      INTEGER DEFAULT 0,             -- Analytics
    is_active           BOOLEAN DEFAULT true,         -- Soft delete flag
    created_at          TIMESTAMPTZ DEFAULT now(),
    updated_at          TIMESTAMPTZ DEFAULT now()
);

-- CLIAnalytics table (optional for MVP, but good to have)
-- Tracks CLI usage for insights
CREATE TABLE CLIAnalytics (
    id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    event_type          TEXT NOT NULL,                -- "install", "add", "list", "init"
    component_name      TEXT REFERENCES ComponentRegistry(name) ON DELETE SET NULL,
    cli_version         TEXT,                         -- e.g., "0.1.0"
    platform            TEXT,                         -- "windows", "macos", "linux"
    timestamp           TIMESTAMPTZ DEFAULT now()
);

-- Row Level Security (RLS) Policies
-- Public read access for CLI and web
ALTER TABLE ComponentRegistry ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public read" ON ComponentRegistry
    FOR SELECT USING (is_active = true);

-- Only service role can write (via GitHub Actions)
CREATE POLICY "Service role full access" ON ComponentRegistry
    FOR ALL USING (auth.role() = 'service_role');
```

### Indexes for Performance

```sql
-- Fast lookup by name
CREATE INDEX idx_component_name ON ComponentRegistry(name);

-- Category filtering
CREATE INDEX idx_component_category ON ComponentRegistry(category);

-- Full-text search (for future search feature)
CREATE INDEX idx_component_search ON ComponentRegistry 
    USING gin(to_tsvector('english', name || ' ' || description));
```

---

## 8. API ROUTES / ENDPOINTS

### Supabase REST API (Auto-generated)

Supabase auto-generates REST endpoints from table schema। CLI এবং web site এই endpoints ব্যবহার করে।

| Method | Endpoint | Description | Auth |
|--------|----------|-------------|------|
| GET | `/rest/v1/ComponentRegistry` | List all components | Public (anon key) |
| GET | `/rest/v1/ComponentRegistry?name=eq.button` | Get specific component | Public |
| GET | `/rest/v1/ComponentRegistry?category=eq.inputs` | Filter by category | Public |
| POST | `/rest/v1/ComponentRegistry` | Add/update component | Service Role only |
| PATCH | `/rest/v1/ComponentRegistry?id=eq.xxx` | Update component | Service Role only |
| DELETE | `/rest/v1/ComponentRegistry?id=eq.xxx` | Soft delete | Service Role only |

### API Caching Strategy (Database Load Protection)

**Problem:** Supabase free tier has 500 req/min limit. If 1000+ developers use CLI simultaneously, we'll hit rate limits.

**Solution:** Next.js API Routes as caching proxy + Vercel Edge Cache

**Architecture:**

```
CLI Request → Next.js API Route → Vercel Edge Cache (24h) → Supabase (cache miss only)
```

**Implementation:**

| Layer | Cache Strategy | TTL |
|-------|---------------|-----|
| **Vercel Edge** | Component list, individual components | 24 hours |
| **Next.js API** | SWR (stale-while-revalidate) pattern | 1 hour stale, 24 hour max |
| **CLI Local** | Component list cache | 1 hour |

**API Routes:**

```typescript
// apps/ui/app/api/flutter/components/route.ts
import { NextResponse } from 'next/server';

export const runtime = 'edge'; // Edge runtime for speed

const CACHE_KEY = 'flutter-components-list';
const CACHE_TTL = 86400; // 24 hours in seconds

export async function GET() {
  // Try cache first
  const cached = await caches.open('flutman-flutter').match(CACHE_KEY);
  if (cached) {
    return new NextResponse(cached.body, {
      headers: { 'X-Cache': 'HIT' }
    });
  }
  
  // Cache miss - fetch from Supabase
  const components = await fetchFromSupabase();
  
  // Store in edge cache
  const response = NextResponse.json(components, {
    headers: {
      'Cache-Control': `public, max-age=${CACHE_TTL}, stale-while-revalidate=3600`,
      'X-Cache': 'MISS'
    }
  });
  
  return response;
}
```

**CLI Cache Behavior:**

```dart
// CLI checks local cache first
final cacheFile = File('.flutman/cache/components.json');
if (cacheFile.existsSync() && cacheAge < Duration(hours: 1)) {
  return loadFromCache(); // No network call
}

// Fetch from API (which may serve from Vercel Edge Cache)
final response = await http.get(Uri.parse('https://flutman.vercel.app/api/flutter/components'));
if (response.headers['x-cache'] == 'HIT') {
  print('✓ Served from cache');
}
```

**Benefits:**
- 95%+ cache hit rate for component list (rarely changes)
- Supabase calls reduced from 1000/min to ~1/hour
- Sub-100ms response times globally (Vercel Edge)

---

### Query Examples

**List all active components (via API):**
```bash
curl "https://flutman.vercel.app/api/flutter/components" \
  -H "apikey: xxxxxx"
```

**Direct Supabase (admin/internal only):**
```bash
curl "https://xxxx.supabase.co/rest/v1/ComponentRegistry?select=name,description,category&is_active=eq.true" \
  -H "apikey: xxxxxx"
```

**Get full component code:**
```bash
curl "https://xxxx.supabase.co/rest/v1/ComponentRegistry?name=eq.button&select=name,code,props" \
  -H "apikey: xxxxxx"
```

**Search by category:**
```bash
curl "https://xxxx.supabase.co/rest/v1/ComponentRegistry?category=eq.inputs&select=*" \
  -H "apikey: xxxxxx"
```

---

## 9. TECH STACK

| Layer | Technology | Reason |
|-------|------------|--------|
| **Docs Frontend** | Next.js 15 App Router + Fumadocs | Existing, unchanged infrastructure |
| **Docs Styling** | Tailwind CSS + shadcn/ui | Existing design system |
| **CLI Language** | Dart | Native for Flutter developers |
| **CLI Framework** | `args` package + `http` package | Lightweight, no heavy dependencies |
| **Automation** | TypeScript (Node.js) | ZeroFounder standard, GitHub Actions native |
| **Database** | Supabase (PostgreSQL) | Free tier, REST API built-in, RLS |
| **Hosting** | Vercel (docs) + pub.dev (CLI) | Standard distribution channels |
| **Package Manager** | pnpm (monorepo), dart pub (CLI) | Appropriate for each ecosystem |

### Free Tier Limits

| Service | Limit | Our Usage |
|---------|-------|-----------|
| Supabase (Free) | 500MB DB, 500 req/min | ~50MB (text only), ~100 req/day initially |
| Vercel (Free) | 100GB bandwidth, 10k requests/day | Docs site, well within limits |
| pub.dev | Unlimited packages | CLI package only |
| GitHub Actions | 2000 minutes/month | Sync script ~2 min/run, ~100 runs/month |

---

## 10. ENVIRONMENT VARIABLES

### For GitHub Actions (Secrets)

```bash
# Repository Settings > Secrets and variables > Actions

SUPABASE_URL=https://xxxx.supabase.co
SUPABASE_SERVICE_ROLE_KEY=eyJ...  # Service role, NOT anon key
```

### For CLI Users (flutman.yaml)

```yaml
# Auto-generated on `flutman init`, can be customized

flutman:
  components_dir: lib/components/
  base_url: https://flutman.vercel.app
  
supabase:
  url: https://xxxx.supabase.co
  anon_key: eyJ...  # Public anon key, safe to commit if needed
```

### For Local Development (scripts/.env)

```bash
# scripts/.env (not committed)
SUPABASE_URL=https://xxxx.supabase.co
SUPABASE_SERVICE_ROLE_KEY=eyJ...

# For testing parser locally
DEBUG=true
```

---

## 11. 30-DAY MVP BUILD PLAN

### Week 1 (Day 1-7): Foundation & Database

| Day | Task |
|-----|------|
| 1 | Supabase project setup, `ComponentRegistry` table creation |
| 2 | Test data insertion (3 sample components) |
| 3 | GitHub Actions workflow skeleton, TS script boilerplate |
| 4 | Parser implementation: Dart file reader, class name extractor |
| 5 | Parser implementation: MDX frontmatter parser, props extractor |
| 6 | Supabase sync logic, upsert operation |
| 7 | **Milestone:** Push to `registry/flutter/` auto-syncs to Supabase |

### Week 2 (Day 8-14): CLI Development

| Day | Task |
|-----|------|
| 8 | CLI project structure, `pubspec.yaml`, entry point |
| 9 | `flutman init` command, config file generation |
| 10 | `flutman list` command, table output formatting |
| 11 | `flutman add` command, API integration |
| 12 | File write logic, directory handling, overwrite prompts |
| 13 | Error handling, retry logic, user-friendly messages |
| 14 | **Milestone:** CLI can successfully add components to Flutter project |

### Week 3 (Day 15-21): Documentation & Integration

| Day | Task |
|-----|------|
| 15 | Create `registry/flutter/` folder structure |
| 16 | Build 5 core components: Button, Input, Card, Dialog, Avatar |
| 17 | Build 5 more: Badge, Alert, Toast, Select, Checkbox |
| 18 | Write MDX documentation for all 10 components |
| 19 | Fumadocs integration test, routing verification |
| 20 | Preview images/GIFs generation |
| 21 | **Milestone:** All 10 components documented and browsable on web |

### Week 4 (Day 22-30): Polish & Launch

| Day | Task |
|-----|------|
| 22 | End-to-end testing: push → sync → CLI add → usage |
| 23 | Error edge cases testing (no internet, invalid component, etc.) |
| 24 | README documentation, CLI help text refinement |
| 25 | pub.dev package preparation, metadata, versioning |
| 26 | CLI published to pub.dev |
| 27 | Final web styling check (ensure 100% unchanged look) |
| 28 | Production deploy, domain verification |
| 29 | Soft launch, Twitter/LinkedIn announcement draft |
| 30 | **Launch Day:** Public announcement, gather feedback |

---

## 12. OPEN QUESTIONS & RISKS

### Open Questions

- [ ] **Q1:** Component previews web এ কিভাবে দেখাবো? Static images vs Flutter web embed vs GIF?
  - *Decision needed from:* Founder
  - *Impact:* Medium (affects Week 3 work)

- [ ] **Q2:** CLI এ authentication দরকার? Public components anon access, premium boilerplates JWT?
  - *Decision needed from:* Founder
  - *Impact:* High (affects CLI architecture)

- [ ] **Q3:** Component dependencies কিভাবে handle করবো? e.g., Button এ Icon component লাগলে?
  - *Decision needed from:* Developer
  - *Impact:* Medium (affects parser logic)

### Technical Risks

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Dart parser regex-based হওয়ায় corner cases miss করতে পারে | Medium | Medium | Manual review process, parser improvements over time |
| Supabase free tier limit hit হতে পারে | Low | High | Monitoring alerts, upgrade path documented |
| CLI cross-platform issues (Windows/Mac/Linux) | Medium | Medium | CI testing on all platforms, clear requirements doc |
| Flutter widget code incompatible with user Flutter version | Medium | High | Version range documentation, Flutter 3.0+ as minimum |

### Business Risks

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Existing React users confused দুইটা library দেখে | Medium | Medium | Clear navigation separation, "Flutter" badge prominently |
| pub.dev package name already taken | Low | High | Backup names: `flutman_cli`, `flutman_ui` |
| Slow adoption - Flutter devs shadcn pattern চেনে না | Medium | High | Tutorial content, YouTube demo videos |

---

## PRD SUMMARY

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PRD SUMMARY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Product     : FlutMan Flutter UI Library
Stack       : Next.js (docs) + Dart CLI + Supabase
MVP Deadline: 30 days
Complexity  : Medium
AI Layer    : No
Open Items  : 3 questions need clarification
Build-ready : Yes (pending Q1, Q2, Q3 decisions)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

**Next Steps:**
1. Review Open Questions (Q1-Q3)
2. Finalize decisions
3. Start Week 1 development (Supabase setup)
