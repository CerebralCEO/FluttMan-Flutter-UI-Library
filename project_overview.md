# coss.com প্রোজেক্ট ডকুমেন্টেশন - A থেকে Z সম্পূর্ণ বিশ্লেষণ

---

## 📋 প্রোজেক্ট পরিচিতি

**coss.com** (পূর্বে Origin UI) একটি কমার্শিয়াল ওপেন সোর্স সফটওয়্যার (COSS) কোম্পানি যা cal.com এর হোল্ডিং কোম্পানি। এই প্রোজেক্টটি একটি টার্বোরেপো মনোরেপো যা একাধিক অ্যাপ্লিকেশন এবং প্যাকেজ নিয়ে গঠিত।

### মূল মিশন
- ডেভেলপারদের জন্য `@coss` npm প্যাকেজ তৈরি করা যা এক লাইনে ইন্সটল করা যায়
- ইমেইল, SMS, ক্যালেন্ডার API, শিডিউলিং, ভিডিও কনফারেন্সিং, নোটিফিকেশন ইত্যাদি সেবা প্রদান
- ওপেন সোর্স প্রজেক্টগুলোর জন্য একটি সাস্টেইনেবল হোম তৈরি করা

---

## 🏗️ আর্কিটেকচার এবং টেক স্ট্যাক

### মনোরেপো স্ট্রাকচার (Turborepo)

```
coss-main/
├── apps/                    # প্রধান অ্যাপ্লিকেশনগুলো
│   ├── www/                # coss.com মূল ওয়েবসাইট
│   ├── ui/                 # coss ui কম্পোনেন্ট লাইব্রেরি ও ডকুমেন্টেশন
│   ├── origin/             # লেগাসি Origin UI কম্পোনেন্ট
│   └── examples/
│       └── calcom/         # ক্যালকম উদাহরণ অ্যাপ
├── packages/               # শেয়ার্ড প্যাকেজগুলো
│   ├── ui/                 # @coss/ui শেয়ার্ড UI প্যাকেজ
│   └── typescript-config/  # TypeScript কনফিগারেশন
└── রুট কনফিগারেশন ফাইলগুলো
```

### টেক স্ট্যাক বিস্তারিত

| ক্যাটেগরি | প্রযুক্তি | সংস্করণ |
|---------|----------|---------|
| **ফ্রেমওয়ার্ক** | Next.js | 16.1.7 |
| **রিয়াক্ট** | React | 19.2.3 |
| **ল্যাংগুয়েজ** | TypeScript | 5.9.3 |
| **প্যাকেজ ম্যানেজার** | Bun | 1.3.1 |
| **বিল্ড টুল** | Turborepo | 2.6.1 |
| **স্টাইলিং** | Tailwind CSS | 4.1.17 |
| **UI লাইব্রেরি** | Base UI | 1.4.1 |
| **ডকুমেন্টেশন** | Fumadocs | 16.x |
| **লিন্টার/ফরম্যাটার** | Biome | 2.3.10 |
| **আইকন** | Lucide React, HugeIcons | সর্বশেষ |
| **থিম** | next-themes | 0.4.6 |
| **স্টেট ম্যানেজমেন্ট** | Jotai | 2.15.1 |

---

## 📦 প্যাকেজ এবং অ্যাপ বিশ্লেষণ

### 1. apps/www/ - মূল ওয়েবসাইট

**উদ্দেশ্য:** coss.com এর প্রধান মার্কেটিং ওয়েবসাইট

**প্রধান ফিচার:**
- কোম্পানি পরিচিতি এবং মিশন বিবরণ
- ওয়েটলিস্ট রেজিস্ট্রেশন
- চাকরির বিজ্ঞপ্তি

**কম্পোনেন্ট স্ট্রাকচার:**
```
app/
├── layout.tsx           # রুট লেআউট (ThemeProvider, Header, Footer)
├── page.tsx            # হোমপেইজ (কোম্পানি পরিচিতি)
├── globals.css         # গ্লোবাল স্টাইল
├── not-found.tsx       # ৪০৪ পেইজ
├── sitemap.ts          # SEO সাইটম্যাপ
├── robots.ts           # রোবোটস টেক্স্ট
├── auth/               # অথেনটিকেশন পেইজ
├── auth copy/          # অথেনটিকেশন কপি
├── calendar/           # ক্যালেন্ডার পেইজ
├── email/              # ইমেইল পেইজ
├── notifications/      # নোটিফিকেশন পেইজ
├── payments/           # পেমেন্ট পেইজ
├── scheduling/         # শিডিউলিং পেইজ
├── sms/                # SMS পেইজ
└── video/              # ভিডিও পেইজ
```

**ডিপেন্ডেন্সি:**
- `@coss/ui`: workspace:*
- `@hugeicons/core-free-icons`: ^2.0.0
- `@hugeicons/react`: ^1.1.1
- `lucide-react`: ^0.555.0
- `next`: 16.1.7
- `react`: ^19.2.3
- `tailwindcss`: ^4.1.17

---

### 2. apps/ui/ - coss ui কম্পোনেন্ট লাইব্রেরি

**উদ্দেশ্য:** আধুনিক UI কম্পোনেন্ট লাইব্রেরি এবং ডকুমেন্টেশন সাইট

**প্রধান ফিচার:**
- Base UI এর উপরে তৈরি কম্পোনেন্ট
- Tailwind CSS দিয়ে স্টাইল করা
- কপি-পেস্ট করার উপযোগী কম্পোনেন্ট
- Fumadocs দিয়ে ডকুমেন্টেশন

**কম্পোনেন্ট স্ট্রাকচার:**
```
app/
├── layout.tsx              # রুট লেআউট (ThemeProvider, Toast, Header)
├── page.tsx               # হোমপেইজ (ক্যাটেগরি কার্ড)
├── globals.css            # গ্লোবাল স্টাইল
├── not-found.tsx          # ৪০৪ পেইজ
├── sitemap.ts             # SEO সাইটম্যাপ
├── api/                   # API রুট
│   └── raw/              # র ডকুমেন্টেশন এন্ডপয়েন্ট
├── docs/                  # ডকুমেন্টেশন লেআউট
│   ├── layout.tsx        # ডকস সাইডবার লেআউট
│   └── [[...slug]]/      # ডাইনামিক ডকুমেন্টেশন পেইজ
├── particles/             # কম্পোনেন্ট ব্রাউজার
│   ├── page.tsx          # পার্টিকেলস পেইজ
│   ├── particle-card.tsx # পার্টিকেল কার্ড
│   ├── search-container.tsx # সার্চ কন্টেইনার
│   └── ...
└── opengraph-image.png    # OG ইমেজ

components/
├── site-header.tsx        # সাইট হেডার
├── site-footer.tsx        # সাইট ফুটার
├── docs-sidebar.tsx       # ডকুমেন্টেশন সাইডবার
├── command-menu.tsx       # কমান্ড মেনু
├── component-preview.tsx  # কম্পোনেন্ট প্রিভিউ
├── category-thumbnails.tsx # ক্যাটেগরি থাম্বনেইল
├── main-nav.tsx          # মূল নেভিগেশন
└── mobile-nav.tsx        # মোবাইল নেভিগেশন

registry/
├── __index__.tsx          # রেজিস্ট্রি ইন্ডেক্স
├── default/               # ডিফল্ট রেজিস্ট্রি আইটেম
├── registry-particles.ts  # পার্টিকেলস রেজিস্ট্রি
├── registry-ui.ts        # UI কম্পোনেন্ট রেজিস্ট্রি
├── registry-base-ui.ts   # Base UI রেজিস্ট্রি
├── registry-categories.ts # ক্যাটেগরি রেজিস্ট্রি
├── registry-hooks.ts     # হুকস রেজিস্ট্রি
├── registry-lib.ts       # লাইব্রেরি রেজিস্ট্রি
└── registry-styles.ts    # স্টাইল রেজিস্ট্রি

content/docs/              # MDX ডকুমেন্টেশন
├── (root)/               # রুট ডকুমেন্টেশন
├── components/           # কম্পোনেন্ট ডকুমেন্টেশন
├── hooks/                # হুকস ডকুমেন্টেশন
└── resources/            # রিসোর্স ডকুমেন্টেশন
```

**ডিপেন্ডেন্সি:**
- `@base-ui/react`: 1.4.1 (প্রধান UI প্রিমিটিভ)
- `@coss/ui`: workspace:*
- `fumadocs-core`: ^16.0.14 (ডকুমেন্টেশন)
- `fumadocs-mdx`: ^14.0.3
- `jotai`: ^2.15.1 (স্টেট ম্যানেজমেন্ট)
- `zod`: ^4.1.12 (ভ্যালিডেশন)
- `class-variance-authority`: ^0.7.1
- `clsx`: ^2.1.1
- `tailwind-merge`: ^3.4.0

---

### 3. apps/origin/ - লেগাসি Origin UI

**উদ্দেশ্য:** আগের Origin UI কম্পোনেন্টস (Radix UI ভিত্তিক)

**প্রধান ফিচার:**
- Radix UI প্রিমিটিভ ব্যবহার করে তৈরি
- shadcn/ui স্টাইল
- লেগাসি সাপোর্ট

**কম্পোনেন্ট স্ট্রাকচার:**
```
app/
├── layout.tsx            # রুট লেআউট (Google Fonts, ThemeProvider)
├── page.tsx             # হোমপেইজ (কম্পোনেন্ট গ্যালারি)
├── globals.css          # গ্লোবাল স্টাইল (OKLCH রং ব্যবহার)
├── not-found.tsx        # ৪০৪ পেইজ
├── sitemap.ts           # SEO সাইটম্যাপ
├── [category]/          # ডাইনামিক ক্যাটেগরি পেইজ
├── easings/             # ইজিং ডেমো
└── search/              # সার্চ ফাংশনালিটি

components/
├── header.tsx           # হেডার কম্পোনেন্ট
├── footer.tsx           # ফুটার কম্পোনেন্ট
├── theme-provider.tsx   # থিম প্রভাইডার
├── top-banner.tsx       # টপ ব্যানার
└── (অন্যান্য UI কম্পোনেন্ট)

registry/
├── default/            # ডিফল্ট কম্পোনেন্ট রেজিস্ট্রি
└── (shadcn রেজিস্ট্রি ফাইলগুলো)
```

**ডিপেন্ডেন্সি:**
- `radix-ui`: 1.4.4-rc.1762291353631
- `@radix-ui/react-icons`: ^1.3.2
- `@dnd-kit/core`: ^6.3.1 (ড্র্যাগ অ্যান্ড ড্রপ)
- `cmdk`: 1.1.1 (কমান্ড মেনু)
- `react-aria`: ^3.44.0
- `react-aria-components`: ^1.13.0
- `sonner`: ^2.0.7 (টোস্ট নোটিফিকেশন)
- `next-themes`: ^0.4.6

---

### 4. packages/ui/ - @coss/ui শেয়ার্ড প্যাকেজ

**উদ্দেশ্য:** সমস্ত অ্যাপ্লিকেশনের জন্য শেয়ার্ড UI কম্পোনেন্ট

**এক্সপোর্ট স্ট্রাকচার:**
```
src/
├── components/           # ৫০+ UI কম্পোনেন্ট
│   ├── accordion.tsx
│   ├── alert.tsx
│   ├── alert-dialog.tsx
│   ├── autocomplete.tsx
│   ├── avatar.tsx
│   ├── badge.tsx
│   ├── breadcrumb.tsx
│   ├── button.tsx
│   ├── calendar.tsx
│   ├── card.tsx
│   ├── checkbox.tsx
│   ├── collapsible.tsx
│   ├── combobox.tsx
│   ├── command.tsx
│   ├── dialog.tsx
│   ├── drawer.tsx
│   ├── dropdown-menu.tsx
│   ├── input.tsx
│   ├── menu.tsx
│   ├── popover.tsx
│   ├── select.tsx
│   ├── sheet.tsx
│   ├── sidebar.tsx
│   ├── table.tsx
│   ├── tabs.tsx
│   ├── toast.tsx
│   ├── tooltip.tsx
│   └── (আরও অনেক কম্পোনেন্ট)
│
├── base-ui/             # Base UI এক্সপোর্ট
│   ├── csp-provider.ts
│   ├── direction-provider.ts
│   ├── merge-props.ts
│   └── use-render.ts
│
├── hooks/               # কাস্টম রিয়াক্ট হুকস
│   ├── use-copy-to-clipboard.ts
│   └── use-media-query.ts
│
├── lib/                 # ইউটিলিটি ফাংশন
│   ├── utils.ts         # cn() হেলপার
│   ├── config.ts        # কনফিগারেশন
│   └── highlight-code.ts # কোড হাইলাইটিং
│
├── shared/              # শেয়ার্ড কম্পোনেন্ট
│   ├── theme-provider.tsx
│   ├── site-header.tsx
│   ├── site-footer.tsx
│   ├── site-cta.tsx
│   ├── page-header.tsx
│   ├── code-block.tsx
│   ├── copy-button.tsx
│   ├── github-link.tsx
│   ├── mobile-nav.tsx
│   ├── mode-switcher.tsx
│   ├── icons.tsx        # ১৫৮১০ বাইট আইকন
│   ├── product-label.tsx
│   └── products-dropdown.tsx
│
├── fonts/               # কাস্টম ফন্ট
│   ├── index.ts
│   ├── CalSans-Regular.woff2
│   ├── CalSansUI[wght,GEOM].woff2
│   └── PaperMono-Regular.woff2
│
└── styles/
    └── globals.css      # গ্লোবাল CSS (৪৬৪ লাইন)
```

**প্যাকেজ.json exports:**
```json
{
  "./base-ui/*": "./src/base-ui/*.ts",
  "./components/*": "./src/components/*.tsx",
  "./fonts": "./src/fonts/index.ts",
  "./globals.css": "./src/styles/globals.css",
  "./hooks/*": "./src/hooks/*.ts",
  "./lib/*": "./src/lib/*.ts",
  "./postcss.config": "./postcss.config.mjs",
  "./shared/*": "./src/shared/*.tsx"
}
```

---

### 5. packages/typescript-config/

**উদ্দেশ্য:** শেয়ার্ড TypeScript কনফিগারেশন

**এক্সপোর্ট:**
- `base.json`: বেস TS কনফিগ
- `nextjs.json`: Next.js প্রজেক্টের জন্য
- `react-library.json`: রিয়াক্ট লাইব্রেরির জন্য

---

## ⚙️ কনফিগারেশন ফাইল বিশ্লেষণ

### 1. turbo.json (Turborepo কনফিগারেশন)

```json
{
  "$schema": "https://turborepo.com/schema.json",
  "globalEnv": ["NODE_ENV"],
  "tasks": {
    "build": {
      "dependsOn": ["^build"],
      "inputs": ["$TURBO_DEFAULT$", ".env*"],
      "outputs": [".next/**", "!.next/cache/**"]
    },
    "dev": {
      "cache": false,
      "persistent": true
    },
    "lint": {
      "cache": true,
      "dependsOn": ["^lint"]
    },
    "typecheck": {
      "cache": true,
      "dependsOn": ["^typecheck"]
    }
  },
  "ui": "tui"
}
```

**বিশ্লেষণ:**
- `dependsOn`: টাস্ক নির্ভরশীলতা সংজ্ঞায়িত করে
- `inputs`: টাস্ক ইনপুট ডিফাইন করে
- `outputs`: ক্যাশ করা আউটপুট
- `cache`: টাস্ক ক্যাশিং সক্ষম/অক্ষম
- `ui: "tui"`: টার্মিনাল ইউজার ইন্টারফেস

---

### 2. biome.json (লিন্টিং ও ফরম্যাটিং)

**প্রধান কনফিগারেশন:**
- **Formatter**: ২ স্পেস ইন্ডেন্ট, ৮০ ক্যারেক্টার লাইন প্রস্থ
- **Linter**: আক্সেসিবিলিটি, পারফরম্যান্স, সিকিউরিটি, স্টাইল রুলস
- **CSS Parser**: Tailwind CSS ডিরেক্টিভ সাপোর্ট
- **Import Organization**: কাস্টম গ্রুপিং

**বিশেষ রুলস:**
```json
{
  "a11y": {
    "noLabelWithoutControl": "off",
    "noStaticElementInteractions": "off"
  },
  "nursery": {
    "useSortedClasses": {
      "level": "warn",
      "options": {
        "attributes": ["className", "classList"],
        "functions": ["clsx", "cva", "cn", "tw", "tw.*"]
      }
    }
  }
}
```

---

### 3. Root package.json

**ওয়ার্কস্পেস কনফিগারেশন:**
```json
{
  "workspaces": [
    "apps/*",
    "apps/examples/*",
    "packages/*"
  ],
  "packageManager": "bun@1.3.1",
  "scripts": {
    "build": "turbo run build",
    "dev": "turbo run dev",
    "lint": "turbo run lint",
    "format": "biome format --write .",
    "typecheck": "turbo run typecheck",
    "test": "bun test --pass-with-no-tests"
  }
}
```

---

## 🎨 ডিজাইন সিস্টেম বিশ্লেষণ

### 1. কালার সিস্টেম (Tailwind CSS v4)

**Root CSS ভেরিয়েবল (globals.css):**
```css
:root {
  --radius: 0.625rem;
  
  /* প্রাইমারি রং */
  --primary: var(--color-neutral-800);
  --primary-foreground: var(--color-neutral-50);
  
  /* সেকেন্ডারি রং */
  --secondary: --alpha(var(--color-black) / 4%);
  --secondary-foreground: var(--color-neutral-800);
  
  /* অ্যাকসেন্ট রং */
  --accent: --alpha(var(--color-black) / 4%);
  --accent-foreground: var(--color-neutral-800);
  
  /* স্টেট রং */
  --destructive: var(--color-red-500);
  --info: var(--color-blue-500);
  --success: var(--color-emerald-500);
  --warning: var(--color-amber-500);
  
  /* বর্ডার ও ইনপুট */
  --border: --alpha(var(--color-black) / 8%);
  --input: --alpha(var(--color-black) / 10%);
  --ring: var(--color-neutral-400);
  
  /* চার্ট রং */
  --chart-1: var(--color-orange-600);
  --chart-2: var(--color-teal-600);
  --chart-3: var(--color-cyan-900);
  --chart-4: var(--color-amber-400);
  --chart-5: var(--color-amber-500);
  
  /* সাইডবার */
  --sidebar: var(--color-neutral-50);
}
```

**Dark Mode:**
- `dark` ক্লাস ব্যবহার করে থিম পরিবর্তন
- `next-themes` দিয়ে থিম ম্যানেজমেন্ট
- স্বয়ংক্রিয় সিস্টেম থিম সনাক্তকরণ

---

### 2. টাইপোগ্রাফি সিস্টেম

**ফন্ট ফ্যামিলি:**
```typescript
// @coss/ui/fonts
export const fontMono = localFont({
  src: "./PaperMono-Regular.woff2",
  variable: "--font-mono",
});

export const fontSans = localFont({
  src: "./CalSansUI[wght,GEOM].woff2",
  variable: "--font-sans",
  weight: "300 700",
});

export const fontHeading = localFont({
  src: "./CalSans-Regular.woff2",
  variable: "--font-heading",
  weight: "400 600",
});
```

**CSS ভেরিয়েবল:**
```css
@theme inline {
  --font-sans: var(--font-sans);
  --font-heading: var(--font-heading);
  --font-mono: var(--font-mono);
}
```

---

### 3. স্পেসিং এবং লেআউট সিস্টেম

**ব্রেকপয়েন্ট:**
```css
--breakpoint-3xl: 1600px;
--breakpoint-4xl: 2000px;
```

**কন্টেইনার:**
```css
@utility container {
  @apply mx-auto max-w-[1416px] px-4 lg:px-6;
}
```

**রেডিয়াস ভেরিয়েবল:**
```css
--radius-sm: calc(var(--radius) - 4px);
--radius-md: calc(var(--radius) - 2px);
--radius-lg: var(--radius);
--radius-xl: calc(var(--radius) + 4px);
```

---

### 4. অ্যানিমেশন সিস্টেম

**কাস্টম অ্যানিমেশন:**
```css
--animate-skeleton: skeleton 2s -1s infinite linear;
--animate-caret-blink: 1s ease-out infinite caret-blink;
--animate-toast-success-odd: toast-success-odd 0.32s cubic-bezier(0.5, 1, 0.89, 1);
--animate-toast-error-odd: toast-error-odd 0.28s cubic-bezier(0.5, 1, 0.89, 1);
```

**কিফ্রেম ডিফিনিশন:**
```css
@keyframes skeleton {
  to { background-position: -200% 0; }
}

@keyframes toast-success-odd {
  0% { scale: 1; }
  30% { scale: 1.025; }
  60% { scale: 0.99; }
  100% { scale: 1; }
}
```

---

## 🧩 UI কম্পোনেন্ট বিশ্লেষণ

### 1. Button কম্পোনেন্ট

```typescript
// packages/ui/src/components/button.tsx
import { cva, type VariantProps } from "class-variance-authority";

const buttonVariants = cva(
  "inline-flex items-center justify-center gap-2 whitespace-nowrap",
  {
    variants: {
      variant: {
        default: "bg-primary text-primary-foreground hover:bg-primary/90",
        destructive: "bg-destructive text-white hover:bg-destructive/90",
        outline: "border border-input bg-background hover:bg-accent",
        secondary: "bg-secondary text-secondary-foreground",
        ghost: "hover:bg-accent hover:text-accent-foreground",
        link: "text-primary underline-offset-4 hover:underline",
      },
      size: {
        default: "h-10 px-4 py-2",
        sm: "h-9 px-3",
        lg: "h-11 px-8",
        icon: "h-10 w-10",
      },
    },
  }
);
```

---

### 2. Card কম্পোনেন্ট

```typescript
// packages/ui/src/components/card.tsx
const Card = React.forwardRef<
  HTMLDivElement,
  React.HTMLAttributes<HTMLDivElement>
>(({ className, ...props }, ref) => (
  <div
    ref={ref}
    className={cn(
      "rounded-xl border bg-card text-card-foreground shadow",
      className
    )}
    {...props}
  />
));
```

---

### 3. Dialog কম্পোনেন্ট

```typescript
// packages/ui/src/components/dialog.tsx
// Base UI Dialog ব্যবহার করে তৈরি
import * as DialogPrimitive from "@base-ui/react/dialog";

const Dialog = DialogPrimitive.Root;
const DialogTrigger = DialogPrimitive.Trigger;
const DialogPortal = DialogPrimitive.Portal;

const DialogContent = React.forwardRef<
  React.ElementRef<typeof DialogPrimitive.Popup>,
  React.ComponentPropsWithoutRef<typeof DialogPrimitive.Popup>
>(({ className, children, ...props }, ref) => (
  <DialogPortal>
    <DialogPrimitive.Backdrop />
    <DialogPrimitive.Popup
      ref={ref}
      className={cn(
        "fixed left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2",
        className
      )}
      {...props}
    >
      {children}
    </DialogPrimitive.Popup>
  </DialogPortal>
));
```

---

### 4. Toast কম্পোনেন্ট

```typescript
// packages/ui/src/components/toast.tsx
// সাধারণ এবং এঙ্কারড টোস্ট সাপোর্ট
const ToastProvider = ToastPrimitive.Provider;
const AnchoredToastProvider = AnchoredToastPrimitive.Provider;

// টোস্ট ভেরিয়েন্ট
const toastVariants = cva(
  "group pointer-events-auto relative flex w-full items-center justify-between",
  {
    variants: {
      variant: {
        default: "border bg-background text-foreground",
        destructive: "destructive border-destructive bg-destructive text-white",
        success: "border-emerald-500/50 bg-emerald-500 text-white",
        info: "border-blue-500/50 bg-blue-500 text-white",
      },
    },
  }
);
```

---

### 5. Sidebar কম্পোনেন্ট

```typescript
// packages/ui/src/components/sidebar.tsx
// জটিল সাইডবার কম্পোনেন্ট
const SidebarProvider = React.forwardRef<
  HTMLDivElement,
  React.ComponentProps<"div"> & {
    defaultOpen?: boolean;
    open?: boolean;
    onOpenChange?: (open: boolean) => void;
  }
>(({ defaultOpen = true, ...props }, ref) => {
  // Sidebar state management logic
});
```

---

## 🔧 হুকস এবং ইউটিলিটি

### 1. use-copy-to-clipboard.ts

```typescript
// packages/ui/src/hooks/use-copy-to-clipboard.ts
export function useCopyToClipboard() {
  const [copied, setCopied] = React.useState(false);
  
  const copy = React.useCallback(async (text: string) => {
    try {
      await navigator.clipboard.writeText(text);
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
      return true;
    } catch {
      return false;
    }
  }, []);
  
  return { copied, copy };
}
```

---

### 2. use-media-query.ts

```typescript
// packages/ui/src/hooks/use-media-query.ts
export function useMediaQuery(query: string): boolean {
  const [matches, setMatches] = React.useState(false);
  
  React.useEffect(() => {
    const media = window.matchMedia(query);
    setMatches(media.matches);
    
    const listener = () => setMatches(media.matches);
    media.addEventListener("change", listener);
    
    return () => media.removeEventListener("change", listener);
  }, [query]);
  
  return matches;
}
```

---

### 3. cn() ইউটিলিটি

```typescript
// packages/ui/src/lib/utils.ts
import { type ClassValue, clsx } from "clsx";
import { twMerge } from "tailwind-merge";

export function cn(...inputs: ClassValue[]): string {
  return twMerge(clsx(inputs));
}
```

**ব্যবহার:**
```typescript
// clsx দিয়ে শর্তভিত্তিক ক্লাস
// twMerge দিয়ে Tailwind ক্লাস মার্জ
className={cn(
  "base-classes",
  isActive && "active-classes",
  isLarge ? "large-classes" : "small-classes"
)}
```

---

## 📄 রাউটিং এবং পেইজ স্ট্রাকচার

### 1. apps/ui - ডকুমেন্টেশন রাউটিং

```
/docs                    # ডকুমেন্টেশন হোম
/docs/components/[slug] # কম্পোনেন্ট ডকুমেন্টেশন
/docs/hooks/[slug]       # হুকস ডকুমেন্টেশন
/particles               # কম্পোনেন্ট ব্রাউজার
/api/raw/docs/[path]     # র ডকুমেন্টেশন API
```

**Next.js Route Config:**
```typescript
// app/docs/[[...slug]]/page.tsx
import { source } from "@/lib/source";

export default async function Page({
  params,
}: {
  params: Promise<{ slug?: string[] }>;
}) {
  const { slug } = await params;
  const page = source.getPage(slug);
  
  if (!page) notFound();
  
  const MDX = page.data.body;
  return <MDX />;
}
```

---

### 2. apps/origin - ক্যাটেগরি রাউটিং

```
/[category]              # ডাইনামিক ক্যাটেগরি পেইজ
/easings                 # ইজিং ডেমো পেইজ
/search                  # সার্চ ফিচার
```

**ডাইনামিক রাউট:**
```typescript
// app/[category]/page.tsx
export default async function Page({
  params,
}: {
  params: Promise<{ category: string }>;
}) {
  const { category } = await params;
  // ক্যাটেগরি অনুযায়ী কম্পোনেন্ট প্রদর্শন
}
```

---

### 3. apps/www - মার্কেটিং পেইজ

```
/                        # হোমপেইজ (কোম্পানি পরিচিতি)
/auth                    # অথেনটিকেশন
/calendar                # ক্যালেন্ডার সেবা
/email                   # ইমেইল সেবা
/notifications           # নোটিফিকেশন সেবা
/payments                # পেমেন্ট সেবা
/scheduling              # শিডিউলিং সেবা
/sms                     # SMS সেবা
/video                   # ভিডিও সেবা
```

---

## 🗃️ কন্টেন্ট ম্যানেজমেন্ট

### MDX ডকুমেন্টেশন সিস্টেম

**Fumadocs Configuration:**
```typescript
// source.config.ts
import { defineConfig, defineDocs } from "fumadocs-mdx/config";

export default defineConfig({
  mdxOptions: {
    rehypePlugins: (plugins) => {
      plugins.push([
        rehypePrettyCode,
        {
          theme: {
            dark: "github-dark",
            light: "github-light-default",
          },
        },
      ]);
      return plugins;
    },
  },
});

export const docs = defineDocs({
  dir: "content/docs",
  docs: {
    schema: frontmatterSchema.extend({
      links: z.object({
        api: z.string().optional(),
        doc: z.string().optional(),
      }).optional(),
    }),
  },
});
```

**MDX ফাইল স্ট্রাকচার:**
```
content/docs/
├── (root)/
│   ├── getting-started/
│   │   └── index.mdx
│   ├── introduction.mdx
│   └── meta.json
├── components/
│   ├── accordion.mdx
│   ├── button.mdx
│   ├── card.mdx
│   └── meta.json
└── meta.json
```

---

## 🔐 থিম ম্যানেজমেন্ট

### ThemeProvider

```typescript
// packages/ui/src/shared/theme-provider.tsx
"use client";

import { ThemeProvider as NextThemesProvider } from "next-themes";

export function ThemeProvider({
  children,
  ...props
}: React.ComponentProps<typeof NextThemesProvider>) {
  return (
    <NextThemesProvider
      attribute="class"
      defaultTheme="system"
      disableTransitionOnChange
      enableColorScheme
      enableSystem
      {...props}
    >
      {children}
    </NextThemesProvider>
  );
}
```

**বৈশিষ্ট্য:**
- `attribute="class"`: dark ক্লাস ব্যবহার
- `defaultTheme="system"`: সিস্টেম থিম অনুযায়ী
- `enableSystem`: সিস্টেম থিম সনাক্তকরণ
- `disableTransitionOnChange`: থিম পরিবর্তনে ট্রানজিশন নিষ্ক্রিয়

---

### Mode Switcher

```typescript
// packages/ui/src/shared/mode-switcher.tsx
"use client";

import { useTheme } from "next-themes";

export function ModeSwitcher() {
  const { theme, setTheme } = useTheme();
  
  return (
    <button onClick={() => setTheme(theme === "dark" ? "light" : "dark")}>
      {theme === "dark" ? <SunIcon /> : <MoonIcon />}
    </button>
  );
}
```

---

## 🛠️ ডেভেলপমেন্ট ওয়ার্কফ্লো

### 1. স্ক্রিপ্টস

**Root package.json:**
```json
{
  "scripts": {
    "build": "turbo run build",
    "clean": "turbo run clean && rm -rf .turbo && rm -rf node_modules",
    "dev": "turbo run dev",
    "format": "biome format --write .",
    "format:all": "biome check --write --unsafe --no-errors-on-unmatched",
    "lint": "turbo run lint --",
    "test": "bun test --pass-with-no-tests",
    "typecheck": "turbo run typecheck"
  }
}
```

**apps/ui package.json:**
```json
{
  "scripts": {
    "build": "next build",
    "dev": "next dev --port 4000",
    "registry:build": "tsx ./scripts/build-registry.mts",
    "ui:sync": "tsx ./scripts/sync-ui.mts"
  }
}
```

---

### 2. এনভায়রনমেন্ট ভেরিয়েবল

**Local Development:**

`apps/www/.env.local`:
```sh
NEXT_PUBLIC_APP_URL=http://localhost:3000
NEXT_PUBLIC_COSS_UI_URL=http://localhost:4000/ui
```

`apps/ui/.env.local`:
```sh
NEXT_PUBLIC_APP_URL=http://localhost:4000/ui
NEXT_PUBLIC_COSS_URL=http://localhost:3000
NEXT_PUBLIC_ORIGIN_URL=http://localhost:4001
```

`apps/origin/.env.local`:
```sh
NEXT_PUBLIC_APP_URL=http://localhost:4001/origin
NEXT_PUBLIC_COSS_URL=http://localhost:3000
NEXT_PUBLIC_COSS_UI_URL=http://localhost:4000/ui
```

---

### 3. Git Hooks

**Husky + lint-staged:**
```json
// lint-staged.config.mjs
export default {
  "*.{ts,tsx,js,jsx}": ["biome check --write --no-errors-on-unmatched"],
};
```

**prepare script:**
```json
{
  "scripts": {
    "prepare": "husky"
  }
}
```

---

## 📊 পার্টিকেলস রেজিস্ট্রি সিস্টেম

### কম্পোনেন্ট ব্রাউজার আর্কিটেকচার

```typescript
// registry/registry-particles.ts
export interface Particle {
  name: string;
  description: string;
  category: string;
  dependencies: string[];
  files: string[];
}

export const particles: Particle[] = [
  {
    name: "button",
    description: "Clickable button component",
    category: "inputs",
    dependencies: ["@base-ui/react"],
    files: ["button.tsx"],
  },
  // ... আরও পার্টিকেলস
];
```

**ব্রাউজার ফিচার:**
- ক্যাটেগরি অনুযায়ী ফিল্টার
- সার্চ ফাংশনালিটি
- রিয়েলটাইম প্রিভিউ
- কোড কপি করার সুবিধা

---

## 🧪 টেস্টিং কনফিগারেশন

**Bun Test:**
```json
{
  "scripts": {
    "test": "bun test --pass-with-no-tests"
  }
}
```

**TypeScript Type Checking:**
```json
{
  "scripts": {
    "typecheck": "tsc --noEmit"
  }
}
```

---

## 🚀 ডিপ্লয়মেন্ট স্ট্রাকচার

### বিল্ড কনফিগারেশন

**Next.js Config (apps/ui):**
```typescript
// next.config.ts
import { createMDX } from "fumadocs-mdx/next";

const withMDX = createMDX();

const nextConfig: NextConfig = {
  basePath: process.env.NEXT_PUBLIC_BASE_PATH || "/ui",
  async redirects() {
    return [
      {
        source: "/docs/radix-shadcn-migration",
        destination: "/docs/radix-migration",
        permanent: true,
      },
    ];
  },
  async rewrites() {
    return [
      {
        source: "/docs/:path*.md",
        destination: "/api/raw/docs/:path*",
      },
    ];
  },
  transpilePackages: ["@coss/ui"],
};

export default withMDX(nextConfig);
```

---

## 📋 কম্পোনেন্ট তালিকা (সম্পূর্ণ)

### packages/ui/src/components/ - ৫০+ কম্পোনেন্ট

| কম্পোনেন্ট | বিবরণ |
|-----------|--------|
| **accordion** | এক্সপ্যান্ডেবল কন্টেন্ট প্যানেল |
| **alert** | নোটিফিকেশন মেসেজ |
| **alert-dialog** | মোডাল ডায়ালগ বক্স |
| **autocomplete** | সার্চেবল ড্রপডাউন |
| **avatar** | ইউজার প্রোফাইল ইমেজ |
| **badge** | স্ট্যাটাস ইন্ডিকেটর |
| **breadcrumb** | নেভিগেশন হায়ারারকি |
| **button** | ক্লিকেবল অ্যাকশন |
| **calendar** | ডেট পিকার |
| **card** | কন্টেন্ট কন্টেইনার |
| **checkbox** | মাল্টি-সিলেক্ট ইনপুট |
| **collapsible** | টগলেবল কন্টেন্ট |
| **combobox** | সিলেক্ট + ইনপুট |
| **command** | কমান্ড প্যালেট |
| **dialog** | মোডাল উইন্ডো |
| **drawer** | স্লাইড-আউট প্যানেল |
| **dropdown-menu** | কনটেক্সটুয়াল মেনু |
| **input** | টেক্সট ইনপুট |
| **menu** | নেভিগেশন মেনু |
| **popover** | টুলটিপ ডায়ালগ |
| **select** | ড্রপডাউন সিলেক্ট |
| **sheet** | সাইড প্যানেল |
| **sidebar** | নেভিগেশন সাইডবার |
| **table** | ডেটা টেবিল |
| **tabs** | ট্যাব ইন্টারফেস |
| **toast** | নোটিফিকেশন টোস্ট |
| **tooltip** | হোভার ইনফো |
| **separator** | ভিজ্যুয়াল বিভাজক |
| **skeleton** | লোডিং প্লেসহোল্ডার |
| **spinner** | লোডিং ইন্ডিকেটর |
| **switch** | টগল সুইচ |
| **slider** | রেইঞ্জ সিলেক্টর |
| **textarea** | মাল্টিলাইন ইনপুট |
| **toggle** | বাইনারি সুইচ |
| **toggle-group** | মাল্টিপল টগল |
| **toolbar** | অ্যাকশন বার |
| **scroll-area** | কাস্টম স্ক্রল |
| **radio-group** | সিঙ্গেল সিলেক্ট |
| **progress** | প্রোগ্রেস বার |
| **pagination** | পেজ নেভিগেশন |
| **otp-field** | ওয়ান-টাইম পাসওয়ার্ড |
| **number-field** | সংখ্যা ইনপুট |
| **meter** | মান পরিমাপ |
| **input-group** | ইনপুট অ্যাডন |
| **kbd** | কীবোর্ড শর্টকাট |
| **label** | ফর্ম লেবেল |
| **fieldset** | ফর্ম গ্রুপ |
| **field** | ফর্ম ফিল্ড |
| **empty** | এম্পটি স্টেট |
| **form** | ফর্ম কন্টেইনার |
| **frame** | লেআউট ফ্রেম |
| **group** | এলিমেন্ট গ্রুপ |
| **preview-card** | প্রিভিউ কার্ড |

---

## 🎨 আইকন সিস্টেম

### আইকন লাইব্রেরি

**1. Lucide React:**
```typescript
import { 
  ChevronDown, 
  ChevronRight, 
  Menu, 
  X, 
  Search,
  Sun,
  Moon,
  // ... আরও আইকন
} from "lucide-react";
```

**2. HugeIcons:**
```typescript
import { 
  HugeiconsIcon,
  Home01Icon,
  UserIcon,
  // ... আরও আইকন
} from "@hugeicons/react";
import * as icons from "@hugeicons/core-free-icons";
```

**3. Remix Icon:**
```typescript
import { 
  RiHomeLine,
  RiUserLine,
  // ... আরও আইকন
} from "@remixicon/react";
```

**4. কাস্টম আইকন (packages/ui/src/shared/icons.tsx):**
- ১৫৮১০ বাইট কাস্টম আইকন কম্পোনেন্ট
- ব্র্যান্ড আইকন
- প্রোডাক্ট আইকন
- UI আইকন

---

## 📦 লাইসেন্সিং স্ট্রাকচার

**মিশ্র লাইসেন্সিং:**

| ফোল্ডার | লাইসেন্স |
|---------|---------|
| `apps/origin/` | MIT |
| `apps/ui/` | MIT |
| `packages/ui/` | AGPL-3.0-or-later |
| অন্যান্য | AGPL-3.0-or-later |

**Root package.json:**
```json
{
  "license": "AGPL-3.0-or-later"
}
```

---

## 🔄 কম্পোনেন্ট সিঙ্ক ওয়ার্কফ্লো

### UI সিঙ্ক প্রক্রিয়া

```typescript
// apps/ui/scripts/sync-ui.mts
// @coss/ui থেকে apps/ui/registry/default তে কম্পোনেন্ট সিঙ্ক

export async function syncComponents() {
  // 1. packages/ui/src/components থেকে ফাইল পড়া
  // 2. apps/ui/registry/default/ui তে কপি করা
  // 3. রেজিস্ট্রি আপডেট করা
  // 4. Biome দিয়ে ফরম্যাট করা
}
```

**সিঙ্ক কমান্ড:**
```bash
bun run ui:sync          # মূল সিঙ্ক
bun run ui:sync:imports  # ইম্পোর্ট সংগঠিত করা
```

---

## 📝 শেয়ার্ড কম্পোনেন্ট বিশ্লেষণ

### SiteHeader

```typescript
// packages/ui/src/shared/site-header.tsx
export function SiteHeader() {
  return (
    <header className="sticky top-0 z-50">
      <div className="container flex h-[var(--header-height)] items-center">
        <MainNav />
        <div className="flex flex-1 items-center justify-end gap-2">
          <ProductsDropdown />
          <ModeSwitcher />
        </div>
      </div>
    </header>
  );
}
```

**বৈশিষ্ট্য:**
- স্টিকি হেডার
- প্রোডাক্ট ড্রপডাউন
- থিম সুইচার
- মোবাইল নেভিগেশন

---

### SiteFooter

```typescript
// packages/ui/src/shared/site-footer.tsx
export function SiteFooter() {
  return (
    <footer className="border-t py-6">
      <div className="container flex flex-col gap-4 md:flex-row md:items-center md:justify-between">
        <p>© {new Date().getFullYear()} coss.com</p>
        <nav className="flex gap-4">
          {/* লিংক */}
        </nav>
      </div>
    </footer>
  );
}
```

---

### PageHeader

```typescript
// packages/ui/src/shared/page-header.tsx
export function PageHeader({
  className,
  children,
}: React.HTMLAttributes<HTMLDivElement>) {
  return (
    <section className={cn("grid gap-1", className)}>
      {children}
    </section>
  );
}

export function PageHeaderHeading({
  className,
  ...props
}: React.HTMLAttributes<HTMLHeadingElement>) {
  return (
    <h1
      className={cn(
        "font-heading text-3xl font-bold tracking-tight",
        className
      )}
      {...props}
    />
  );
}
```

---

## 🔍 SEO এবং মেটাডেটা

### SEO কনফিগারেশন

**Root Layout:**
```typescript
export const metadata: Metadata = {
  title: "coss.com - the everything but AI company",
  description: "Open source scheduling infrastructure",
  metadataBase: new URL("https://coss.com"),
  openGraph: {
    title: "coss.com",
    description: "Commercial open source software",
    images: "/opengraph-image.png",
  },
  twitter: {
    card: "summary_large_image",
    images: "/twitter-image.png",
  },
};
```

**Sitemap:**
```typescript
// sitemap.ts
import { MetadataRoute } from "next";

export default function sitemap(): MetadataRoute.Sitemap {
  return [
    {
      url: "https://coss.com",
      lastModified: new Date(),
      changeFrequency: "yearly",
      priority: 1,
    },
  ];
}
```

**Robots:**
```typescript
// robots.ts
import { MetadataRoute } from "next";

export default function robots(): MetadataRoute.Robots {
  return {
    rules: {
      userAgent: "*",
      allow: "/",
    },
    sitemap: "https://coss.com/sitemap.xml",
  };
}
```

---

## 🔧 CSS কাস্টমাইজেশন

### কাস্টম ভেরিয়েবল ওভাররাইড

```css
/* নিজস্ব থিম তৈরি */
:root {
  --primary: #your-color;
  --primary-foreground: #your-contrast-color;
}

.dark {
  --primary: #your-dark-color;
  --primary-foreground: #your-dark-contrast;
}
```

### কাস্টম কম্পোনেন্ট স্টাইল

```typescript
// clsx এবং tailwind-merge ব্যবহার করে
import { cn } from "@coss/ui/lib/utils";

const customButton = cn(
  baseButtonStyles,
  "bg-custom-primary hover:bg-custom-primary/90",
  isLarge && "h-12 px-6 text-lg"
);
```

---

## 🏗️ আর্কিটেকচার ডায়াগ্রাম

```
┌─────────────────────────────────────────────────────────────┐
│                      Turborepo Root                         │
│                     (coss-main/)                            │
└─────────────────────────────────────────────────────────────┘
                              │
        ┌─────────────────────┼─────────────────────┐
        │                     │                     │
        ▼                     ▼                     ▼
┌───────────────┐    ┌───────────────┐    ┌───────────────┐
│   apps/www    │    │    apps/ui    │    │  apps/origin  │
│   (Port 3000) │    │   (Port 4000) │    │  (Port 4001)  │
├───────────────┤    ├───────────────┤    ├───────────────┤
│ • Marketing   │    │ • Docs        │    │ • Legacy UI   │
│ • Company     │    │ • Particles   │    │ • Radix UI    │
│ • Services    │    │ • Registry    │    │ • shadcn      │
└───────────────┘    └───────────────┘    └───────────────┘
        │                     │                     │
        └─────────────────────┼─────────────────────┘
                              │
                              ▼
              ┌───────────────────────────────┐
              │       packages/ui             │
              │      (@coss/ui)               │
              ├───────────────────────────────┤
              │ • 50+ Components              │
              │ • Shared Hooks                │
              │ • Custom Fonts                │
              │ • Theme Provider              │
              │ • Utility Functions             │
              └───────────────────────────────┘
                              │
                              ▼
              ┌───────────────────────────────┐
              │   packages/typescript-config  │
              │    (@coss/typescript-config)  │
              └───────────────────────────────┘
```

---

## 🎯 মূল শেখার পয়েন্ট

### এই প্রোজেক্ট থেকে শেখা:

1. **Turborepo মনোরেপো ম্যানেজমেন্ট**
   - ওয়ার্কস্পেস কনফিগারেশন
   - টাস্ক নির্ভরশীলতা
   - ক্যাশিং স্ট্রাটেজি

2. **আধুনিক React আর্কিটেকচার**
   - Next.js App Router
   - Server Components
   - Client Components

3. **ডিজাইন সিস্টেম তৈরি**
   - Tailwind CSS v4
   - CSS ভেরিয়েবল
   - থিমিং

4. **UI কম্পোনেন্ট লাইব্রেরি**
   - Base UI প্রিমিটিভ
   - CVA (class-variance-authority)
   - কম্পোজেবল API

5. **ডকুমেন্টেশন সাইট**
   - Fumadocs
   - MDX
   - কোড হাইলাইটিং

6. **কোড কোয়ালিটি**
   - TypeScript
   - Biome
   - Git Hooks

---

## 📞 সাপোর্ট এবং রিসোর্স

### অফিসিয়াল লিংক:
- **ওয়েবসাইট:** https://coss.com
- **UI ডকুমেন্টেশন:** https://coss.com/ui
- **cal.com:** https://cal.com
- **GitHub:** https://github.com/cosscom

### কমিউনিটি:
- **ওয়েটলিস্ট:** https://i.cal.com/forms/...
- **চাকরি:** https://cal.com/jobs

---

## 🎓 পরিশিষ্ট

এই ডকুমেন্টেশনে coss.com প্রোজেক্টের সম্পূর্ণ A থেকে Z বিশ্লেষণ অন্তর্ভুক্ত করা হয়েছে। এই প্রোজেক্ট একটি সophisticated মনোরেপো যা আধুনিক React, Next.js, এবং Tailwind CSS ব্যবহার করে একটি শক্তিশালী UI কম্পোনেন্ট লাইব্রেরি তৈরি করেছে।

**সংক্ষিপ্ত তথ্য:**
- **প্রোজেক্ট নাম:** coss.com (পূর্বে Origin UI)
- **প্রধান কোম্পানি:** cal.com এর হোল্ডিং কোম্পানি
- **টেক স্ট্যাক:** Next.js 16, React 19, TypeScript 5.9, Tailwind CSS 4, Bun
- **আর্কিটেকচার:** Turborepo মনোরেপো
- **লাইসেন্স:** AGPL-3.0-or-later (MIT for apps/ui and apps/origin)

---

*ডকুমেন্টেশন তৈরির তারিখ: ২২ এপ্রিল, ২০২৬*
*সর্বশেষ আপডেট: ২২ এপ্রিল, ২০২৬*
