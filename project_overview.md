# FlutMan UI - সম্পূর্ণ প্রোজেক্ট ডকুমেন্টেশন (A-Z)

---

## 📋 প্রোজেক্ট পরিচিতি

**FlutMan UI** একটি আধুনিক, অ্যাক্সেসিবল এবং কম্পোজেবল React UI কম্পোনেন্ট লাইব্রেরি। এটি **Base UI** এর উপরে তৈরি এবং **Tailwind CSS** দিয়ে স্টাইল করা হয়েছে। এই প্রোজেক্টটি **Turborepo** মনোরেপো আর্কিটেকচারে গঠিত।

### মূল বৈশিষ্ট্য
- ৫০+ রি-ইউজেবল UI কম্পোনেন্ট
- Base UI প্রিমিটিভ ব্যবহার করে তৈরি
- Tailwind CSS v4 দিয়ে স্টাইলিং
- TypeScript দিয়ে ফুল টাইপ সেফটি
- Fumadocs দিয়ে ডকুমেন্টেশন
- কম্পোনেন্ট রেজিস্ট্রি সিস্টেম

---

## 🏗️ আর্কিটেকচার এবং টেক স্ট্যাক

### মনোরেপো স্ট্রাকচার (Turborepo)

```
flutman/
├── apps/
│   └── ui/                 # UI ডকুমেন্টেশন অ্যাপ (Next.js)
├── packages/
│   ├── ui/                 # @flutman/ui শেয়ার্ড প্যাকেজ
│   └── typescript-config/  # TypeScript কনফিগারেশন
├── biome.json              # লিন্টার/ফরম্যাটার কনফিগ
├── turbo.json              # Turborepo কনফিগ
└── package.json            # রুট প্যাকেজ কনফিগ
```

### সম্পূর্ণ টেক স্ট্যাক

| ক্যাটেগরি | প্রযুক্তি | সংস্করণ | উদ্দেশ্য |
|-----------|----------|---------|----------|
| **ফ্রেমওয়ার্ক** | Next.js | 16.1.7 | রিয়াক্ট ফ্রেমওয়ার্ক |
| **রিয়াক্ট** | React | 19.2.3 | UI লাইব্রেরি |
| **ল্যাংগুয়েজ** | TypeScript | 5.9.3 | টাইপ সেফটি |
| **প্যাকেজ ম্যানেজার** | pnpm | 9.15.0 | ডিপেন্ডেন্সি ম্যানেজমেন্ট |
| **বিল্ড টুল** | Turborepo | 2.6.1 | মনোরেপো ম্যানেজমেন্ট |
| **স্টাইলিং** | Tailwind CSS | 4.1.17 | CSS ফ্রেমওয়ার্ক |
| **UI প্রিমিটিভ** | Base UI | 1.4.1 | হেডলেস UI কম্পোনেন্ট |
| **ডকুমেন্টেশন** | Fumadocs | 16.0.14 | MDX ডকুমেন্টেশন |
| **লিন্টার** | Biome | 2.3.10 | কোড কোয়ালিটি |
| **আইকন** | Lucide React | 0.555.0 | আইকন লাইব্রেরি |
| **থিম** | next-themes | 0.4.6 | ডার্ক/লাইট মোড |
| **ভ্যালিডেশন** | Zod | 4.1.12 | স্কিমা ভ্যালিডেশন |
| **স্টেট** | Jotai | 2.15.1 | অ্যাটোমিক স্টেট |

---

## 📁 ফোল্ডার স্ট্রাকচার বিশ্লেষণ

### 1. Root Level কনফিগারেশন

| ফাইল/ফোল্ডার | উদ্দেশ্য |
|--------------|----------|
| `package.json` | মনোরেপো রুট কনফিগ, workspaces ডিফাইন |
| `turbo.json` | Turborepo টাস্ক কনফিগারেশন |
| `biome.json` | কোড লিন্টিং এবং ফরম্যাটিং রুলস |
| `pnpm-workspace.yaml` | pnpm ওয়ার্কস্পেস ডিফিনিশন |
| `tsconfig.json` | TypeScript বেস কনফিগ |
| `.husky/` | Git hooks কনফিগারেশন |
| `lint-staged.config.mjs` | Staged ফাইল লিন্টিং |

### 2. apps/ui/ - ডকুমেন্টেশন অ্যাপ

```
apps/ui/
├── app/                      # Next.js App Router
│   ├── layout.tsx           # রুট লেআউট
│   ├── page.tsx             # হোমপেইজ
│   ├── globals.css          # গ্লোবাল স্টাইল
│   ├── sitemap.ts           # SEO সাইটম্যাপ
│   ├── not-found.tsx        # ৪০৪ পেইজ
│   ├── docs/                # ডকুমেন্টেশন রাউট
│   │   ├── layout.tsx       # ডকস লেআউট
│   │   └── [[...slug]]/     # ডাইনামিক ডক পেইজ
│   ├── _particles/          # কম্পোনেন্ট ব্রাউজার
│   └── api/                 # API রাউট
│       └── raw/             # র ডকুমেন্টেশন
├── components/              # অ্যাপ-স্পেসিফিক কম্পোনেন্ট
│   ├── site-header.tsx      # সাইট হেডার
│   ├── site-footer.tsx      # সাইট ফুটার
│   ├── category-thumbnails.tsx # ক্যাটেগরি থাম্বনেইল
│   ├── component-preview.tsx # কম্পোনেন্ট প্রিভিউ
│   └── ...
├── content/docs/            # MDX ডকুমেন্টেশন ফাইল
│   ├── (root)/             # রুট ডকুমেন্টেশন
│   ├── components/         # কম্পোনেন্ট ডক্স
│   ├── hooks/              # হুকস ডক্স
│   └── resources/          # রিসোর্স ডক্স
├── registry/                # কম্পোনেন্ট রেজিস্ট্রি
│   ├── default/ui/         # UI কম্পোনেন্টস
│   ├── default/hooks/      # কাস্টম হুকস
│   ├── default/lib/        # ইউটিলিটি ফাংশন
│   ├── __index__.tsx       # রেজিস্ট্রি ইন্ডেক্স
│   └── registry-*.ts       # রেজিস্ট্রি কনফিগ ফাইল
├── lib/                     # অ্যাপ-স্পেসিফিক লাইব্রেরি
│   ├── source.ts           # Fumadocs সোর্স
│   └── utils.ts            # ইউটিলিটি ফাংশন
├── public/                  # স্ট্যাটিক অ্যাসেটস
│   ├── llms.txt            # LLM কন্টেক্সট
│   └── ...
├── scripts/                 # বিল্ড স্ক্রিপ্টস
│   ├── build-registry.mts  # রেজিস্ট্রি বিল্ড
│   ├── sync-ui.mts         # UI সিঙ্ক
│   └── ...
├── next.config.ts           # Next.js কনফিগ
├── package.json             # অ্যাপ ডিপেন্ডেন্সি
└── source.config.ts         # Fumadocs কনফিগ
```

### 3. packages/ui/ - শেয়ার্ড UI প্যাকেজ

```
packages/ui/
├── src/
│   ├── components/          # ৫০+ UI কম্পোনেন্ট
│   │   ├── button.tsx
│   │   ├── card.tsx
│   │   ├── dialog.tsx
│   │   ├── toast.tsx
│   │   ├── sidebar.tsx
│   │   └── ... (মোট ৫৩টি)
│   ├── shared/            # শেয়ার্ড কম্পোনেন্ট
│   │   ├── site-header.tsx
│   │   ├── site-footer.tsx
│   │   ├── theme-provider.tsx
│   │   ├── page-header.tsx
│   │   └── icons.tsx      # ১৫৮১০ বাইট আইকন
│   ├── hooks/             # কাস্টম রিয়াক্ট হুকস
│   │   ├── use-copy-to-clipboard.ts
│   │   └── use-media-query.ts
│   ├── lib/               # ইউটিলিটি ফাংশন
│   │   ├── utils.ts       # cn() হেলপার
│   │   └── config.ts      # কনফিগারেশন
│   ├── fonts/             # কাস্টম ফন্ট
│   │   ├── index.ts       # ফন্ট এক্সপোর্ট
│   │   ├── CalSans-Regular.woff2
│   │   └── PaperMono-Regular.woff2
│   ├── base-ui/           # Base UI রি-এক্সপোর্ট
│   │   ├── csp-provider.ts
│   │   ├── direction-provider.ts
│   │   └── use-render.ts
│   └── styles/
│       └── globals.css    # গ্লোবাল CSS (৪৬৪ লাইন)
├── package.json            # প্যাকেজ কনফিগ
└── postcss.config.mjs      # PostCSS কনফিগ
```

---

## ⚙️ কনফিগারেশন ফাইল বিশ্লেষণ

### 1. turbo.json - Turborepo কনফিগারেশন

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
- `^build`: ডিপেন্ডেন্সি প্যাকেজের বিল্ড অপেক্ষা করে
- `cache`: টাস্ক ক্যাশিং সক্ষম/অক্ষম
- `persistent`: dev সার্ভার চালু রাখে
- `ui: "tui"`: টার্মিনাল ইউজার ইন্টারফেস

### 2. biome.json - লিন্টিং ও ফরম্যাটিং

```json
{
  "formatter": {
    "enabled": true,
    "indentStyle": "space",
    "indentWidth": 2,
    "lineWidth": 80
  },
  "linter": {
    "enabled": true,
    "rules": {
      "a11y": {
        "noLabelWithoutControl": "off"
      },
      "nursery": {
        "useSortedClasses": {
          "level": "warn",
          "options": {
            "attributes": ["className", "classList"],
            "functions": ["clsx", "cva", "cn"]
          }
        }
      }
    }
  }
}
```

**বিশ্লেষণ:**
- **Formatter**: ২ স্পেস ইন্ডেন্ট, ৮০ ক্যারেক্টার লাইন প্রস্থ
- **Linter**: আক্সেসিবিলিটি, পারফরম্যান্স, সিকিউরিটি রুলস
- **CSS Parser**: Tailwind CSS ডিরেক্টিভ সাপোর্ট
- **useSortedClasses**: Tailwind ক্লাস অটো-সর্ট

### 3. next.config.ts - Next.js কনফিগারেশন

```typescript
import { createMDX } from "fumadocs-mdx/next";

const withMDX = createMDX();

const nextConfig: NextConfig = {
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
  transpilePackages: ["@flutman/ui"],
};

export default withMDX(nextConfig);
```

**বিশ্লেষণ:**
- `redirects`: URL রিডাইরেক্ট কনফিগ
- `rewrites`: URL রি-রাইট রুলস
- `transpilePackages`: ওয়ার্কস্পেস প্যাকেজ ট্রান্সপাইল

---

## 📦 প্যাকেজ.json ডিপেন্ডেন্সি বিশ্লেষণ

### Root package.json

| ক্যাটেগরি | প্যাকেজ | সংস্করণ | উদ্দেশ্য |
|-----------|--------|---------|----------|
| **DevDeps** | @biomejs/biome | 2.3.10 | লিন্টার/ফরম্যাটার |
| **DevDeps** | husky | 9.1.7 | Git hooks |
| **DevDeps** | lint-staged | 16.2.6 | Staged লিন্টিং |
| **DevDeps** | turbo | 2.6.1 | মনোরেপো বিল্ড |
| **DevDeps** | typescript | 5.9.3 | টাইপ সেফটি |

### apps/ui package.json - মূল ডিপেন্ডেন্সি

| ক্যাটেগরি | প্যাকেজ | উদ্দেশ্য |
|-----------|--------|----------|
| **Core** | @base-ui/react | হেডলেস UI প্রিমিটিভ |
| **Core** | @flutman/ui | শেয়ার্ড UI প্যাকেজ |
| **Core** | next | React ফ্রেমওয়ার্ক |
| **Core** | react | UI লাইব্রেরি |
| **Styling** | tailwindcss | CSS ইউটিলিটি |
| **Styling** | @tailwindcss/postcss | PostCSS প্লাগিন |
| **Styling** | class-variance-authority | কম্পোনেন্ট ভেরিয়েন্ট |
| **Styling** | tailwind-merge | ক্লাস মার্জ |
| **Styling** | clsx | শর্তভিত্তিক ক্লাস |
| **Icons** | lucide-react | আইকন লাইব্রেরি |
| **Icons** | @hugeicons/react | অতিরিক্ত আইকন |
| **Icons** | @remixicon/react | রিমিক্স আইকন |
| **Docs** | fumadocs-core | ডকুমেন্টেশন কোর |
| **Docs** | fumadocs-mdx | MDX সাপোর্ট |
| **Docs** | @shikijs/transformers | সিনট্যাক্স হাইলাইট |
| **State** | jotai | অ্যাটোমিক স্টেট |
| **Utils** | zod | স্কিমা ভ্যালিডেশন |
| **Utils** | date-fns | ডেট ম্যানিপুলেশন |
| **Utils** | ts-morph | TypeScript AST |

---

## 🎨 ডিজাইন সিস্টেম বিশ্লেষণ

### 1. কালার সিস্টেম (Tailwind CSS v4)

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
  
  /* ব্যাকগ্রাউন্ড */
  --background: var(--color-white);
  --foreground: var(--color-neutral-800);
  --card: var(--color-white);
  --card-foreground: var(--color-neutral-800);
  --popover: var(--color-white);
  --popover-foreground: var(--color-neutral-800);
  --muted: var(--color-neutral-50);
  --muted-foreground: var(--color-neutral-500);
  
  /* সাইডবার */
  --sidebar: var(--color-neutral-50);
  --sidebar-foreground: var(--color-neutral-800);
  --sidebar-primary: var(--color-neutral-800);
  --sidebar-primary-foreground: var(--color-neutral-50);
  --sidebar-accent: --alpha(var(--color-black) / 4%);
  --sidebar-accent-foreground: var(--color-neutral-800);
  --sidebar-border: --alpha(var(--color-black) / 8%);
  --sidebar-ring: var(--color-neutral-400);
}

/* ডার্ক মোড */
.dark {
  --background: var(--color-neutral-950);
  --foreground: var(--color-neutral-50);
  --card: var(--color-neutral-950);
  --card-foreground: var(--color-neutral-50);
  --popover: var(--color-neutral-950);
  --popover-foreground: var(--color-neutral-50);
  --muted: var(--color-neutral-900);
  --muted-foreground: var(--color-neutral-400);
  --accent: --alpha(var(--color-white) / 8%);
  --accent-foreground: var(--color-neutral-50);
  --destructive: var(--color-red-500);
  --border: --alpha(var(--color-white) / 8%);
  --input: --alpha(var(--color-white) / 10%);
  --ring: var(--color-neutral-400);
}
```

### 2. টাইপোগ্রাফি সিস্টেম

```typescript
// packages/ui/src/fonts/index.ts
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

export const fontMono = localFont({
  src: "./PaperMono-Regular.woff2",
  variable: "--font-mono",
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

### 3. স্পেসিং এবং লেআউট সিস্টেম

**ব্রেকপয়েন্ট:**
```css
--breakpoint-sm: 640px;
--breakpoint-md: 768px;
--breakpoint-lg: 1024px;
--breakpoint-xl: 1280px;
--breakpoint-2xl: 1536px;
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

### 4. অ্যানিমেশন সিস্টেম

```css
--animate-skeleton: skeleton 2s -1s infinite linear;
--animate-caret-blink: 1s ease-out infinite caret-blink;
--animate-toast-success-odd: toast-success-odd 0.32s cubic-bezier(0.5, 1, 0.89, 1);
--animate-toast-success-even: toast-success-even 0.32s cubic-bezier(0.5, 1, 0.89, 1);
--animate-toast-error-odd: toast-error-odd 0.28s cubic-bezier(0.5, 1, 0.89, 1);
--animate-toast-error-even: toast-error-even 0.28s cubic-bezier(0.5, 1, 0.89, 1);

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

### packages/ui/src/components/ - ৫৩টি কম্পোনেন্টের তালিকা

| কম্পোনেন্ট | ফাইল সাইজ | বিবরণ |
|-----------|----------|--------|
| **accordion** | 2.1KB | এক্সপ্যান্ডেবল কন্টেন্ট প্যানেল |
| **alert** | 2.4KB | নোটিফিকেশন মেসেজ |
| **alert-dialog** | 5.0KB | মোডাল কনফার্মেশন ডায়ালগ |
| **autocomplete** | 10.6KB | সার্চেবল ড্রপডাউন |
| **avatar** | 1.2KB | ইউজার প্রোফাইল ইমেজ |
| **badge** | 2.8KB | স্ট্যাটাস ইন্ডিকেটর |
| **breadcrumb** | 2.5KB | নেভিগেশন হায়ারারকি |
| **button** | 6.1KB | প্রাইমারি অ্যাকশন কম্পোনেন্ট |
| **calendar** | 5.3KB | ডেট পিকার |
| **card** | 7.0KB | কন্টেন্ট কন্টেইনার |
| **checkbox** | 2.9KB | বুলিয়ান ইনপুট |
| **checkbox-group** | 0.4KB | মাল্টিপল চেকবক্স |
| **collapsible** | 1.1KB | টগলেবল কন্টেন্ট |
| **combobox** | 15.2KB | সিলেক্ট + ইনপুট |
| **command** | 7.6KB | কমান্ড প্যালেট |
| **dialog** | 6.5KB | মোডাল উইন্ডো |
| **drawer** | 23.9KB | স্লাইড-আউট প্যানেল |
| **empty** | 3.5KB | এম্পটি স্টেট |
| **field** | 1.8KB | ফর্ম ফিল্ড |
| **fieldset** | 0.7KB | ফর্ম গ্রুপ |
| **form** | 0.3KB | ফর্ম কন্টেইনার |
| **frame** | 2.0KB | লেআউট ফ্রেম |
| **group** | 4.9KB | এলিমেন্ট গ্রুপ |
| **input** | 3.0KB | টেক্সট ইনপুট |
| **input-group** | 6.4KB | ইনপুট অ্যাডন |
| **kbd** | 0.8KB | কীবোর্ড শর্টকাট |
| **label** | 0.6KB | ফর্ম লেবেল |
| **menu** | 11.3KB | নেভিগেশন মেনু |
| **meter** | 1.7KB | মান পরিমাপ |
| **number-field** | 5.8KB | সংখ্যা ইনপুট |
| **otp-field** | 2.7KB | ওয়ান-টাইম পাসওয়ার্ড |
| **pagination** | 3.1KB | পেজ নেভিগেশন |
| **popover** | 4.6KB | টুলটিপ ডায়ালগ |
| **preview-card** | 2.1KB | প্রিভিউ কার্ড |
| **progress** | 1.8KB | প্রোগ্রেস বার |
| **radio-group** | 2.1KB | সিঙ্গেল সিলেক্ট |
| **scroll-area** | 2.5KB | কাস্টম স্ক্রল |
| **select** | 9.4KB | ড্রপডাউন সিলেক্ট |
| **separator** | 0.7KB | ভিজ্যুয়াল বিভাজক |
| **sheet** | 6.8KB | সাইড প্যানেল |
| **sidebar** | 22.7KB | নেভিগেশন সাইডবার |
| **skeleton** | 0.6KB | লোডিং প্লেসহোল্ডার |
| **slider** | 3.1KB | রেইঞ্জ সিলেক্টর |
| **spinner** | 0.4KB | লোডিং ইন্ডিকেটর |
| **switch** | 1.6KB | টগল সুইচ |
| **table** | 5.0KB | ডেটা টেবিল |
| **tabs** | 3.1KB | ট্যাব ইন্টারফেস |
| **textarea** | 2.5KB | মাল্টিলাইন ইনপুট |
| **toast** | 14.2KB | নোটিফিকেশন টোস্ট |
| **toggle** | 2.4KB | বাইনারি সুইচ |
| **toggle-group** | 3.6KB | মাল্টিপল টগল |
| **toolbar** | 2.1KB | অ্যাকশন বার |
| **tooltip** | 3.2KB | হোভার ইনফো |

### প্রধান কম্পোনেন্ট বিশ্লেষণ

#### 1. Button কম্পোনেন্ট (6.1KB)

```typescript
// packages/ui/src/components/button.tsx
import { cva, type VariantProps } from "class-variance-authority";

const buttonVariants = cva(
  "relative inline-flex shrink-0 cursor-pointer items-center justify-center gap-2 whitespace-nowrap rounded-lg border font-medium text-base outline-none transition-shadow",
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
    defaultVariants: {
      variant: "default",
      size: "default",
    },
  }
);

export interface ButtonProps
  extends React.ButtonHTMLAttributes<HTMLButtonElement>,
    VariantProps<typeof buttonVariants> {
  asChild?: boolean;
}

export const Button = React.forwardRef<HTMLButtonElement, ButtonProps>(
  ({ className, variant, size, asChild = false, ...props }, ref) => {
    const Comp = asChild ? Slot : "button";
    return (
      <Comp
        className={cn(buttonVariants({ variant, size, className }))}
        ref={ref}
        {...props}
      />
    );
  }
);
```

**বৈশিষ্ট্য:**
- ৬টি ভেরিয়েন্ট: default, destructive, outline, secondary, ghost, link
- ৪টি সাইজ: default, sm, lg, icon
- `asChild` prop দিয়ে polymorphic রেন্ডারিং
- স্পিনার সাপোর্ট ফর লোডিং স্টেট
- আইকন স্পেসিং অটোমেটিক

#### 2. Card কম্পোনেন্ট (7.0KB)

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

const CardHeader = React.forwardRef<
  HTMLDivElement,
  React.HTMLAttributes<HTMLDivElement>
>(({ className, ...props }, ref) => (
  <div
    ref={ref}
    className={cn("flex flex-col space-y-1.5 p-6", className)}
    {...props}
  />
));

const CardTitle = React.forwardRef<
  HTMLHeadingElement,
  React.HTMLAttributes<HTMLHeadingElement>
>(({ className, ...props }, ref) => (
  <h3
    ref={ref}
    className={cn("font-semibold leading-none tracking-tight", className)}
    {...props}
  />
));

const CardDescription = React.forwardRef<
  HTMLParagraphElement,
  React.HTMLAttributes<HTMLParagraphElement>
>(({ className, ...props }, ref) => (
  <p
    ref={ref}
    className={cn("text-sm text-muted-foreground", className)}
    {...props}
  />
));

const CardContent = React.forwardRef<
  HTMLDivElement,
  React.HTMLAttributes<HTMLDivElement>
>(({ className, ...props }, ref) => (
  <div ref={ref} className={cn("p-6 pt-0", className)} {...props} />
));

const CardFooter = React.forwardRef<
  HTMLDivElement,
  React.HTMLAttributes<HTMLDivElement>
>(({ className, ...props }, ref) => (
  <div
    ref={ref}
    className={cn("flex items-center p-6 pt-0", className)}
    {...props}
  />
));
```

**বৈশিষ্ট্য:**
- Card, CardHeader, CardTitle, CardDescription, CardContent, CardFooter
- রিসার্চ-বেসড স্পেসিং
- সেমান্টিক HTML স্ট্রাকচার

#### 3. Dialog কম্পোনেন্ট (6.5KB)

```typescript
// packages/ui/src/components/dialog.tsx
import * as DialogPrimitive from "@base-ui/react/dialog";

const Dialog = DialogPrimitive.Root;
const DialogTrigger = DialogPrimitive.Trigger;
const DialogPortal = DialogPrimitive.Portal;

const DialogContent = React.forwardRef<
  React.ElementRef<typeof DialogPrimitive.Popup>,
  React.ComponentPropsWithoutRef<typeof DialogPrimitive.Popup>
>(({ className, children, ...props }, ref) => (
  <DialogPortal>
    <DialogPrimitive.Backdrop
      className="fixed inset-0 z-50 bg-black/50 data-[state=open]:animate-in data-[state=closed]:animate-out"
    />
    <DialogPrimitive.Popup
      ref={ref}
      className={cn(
        "fixed left-1/2 top-1/2 z-50 grid w-full max-w-lg -translate-x-1/2 -translate-y-1/2 gap-4 border bg-background p-6 shadow-lg duration-200",
        className
      )}
      {...props}
    >
      {children}
    </DialogPrimitive.Popup>
  </DialogPortal>
));
```

**বৈশিষ্ট্য:**
- Base UI Dialog প্রিমিটিভ ব্যবহার
- ব্যাকড্রপ অ্যানিমেশন
- সেন্টারড মোডাল
- এসকেপ কী সাপোর্ট
- ফোকাস ট্র্যাপ

#### 4. Toast কম্পোনেন্ট (14.2KB)

```typescript
// packages/ui/src/components/toast.tsx
const ToastProvider = ToastPrimitive.Provider;
const AnchoredToastProvider = AnchoredToastPrimitive.Provider;

const toastVariants = cva(
  "group pointer-events-auto relative flex w-full items-center justify-between overflow-hidden rounded-md border p-4 pr-6 shadow-lg transition-all",
  {
    variants: {
      variant: {
        default: "border bg-background text-foreground",
        destructive: "destructive border-destructive bg-destructive text-white",
        success: "border-emerald-500/50 bg-emerald-500 text-white",
        info: "border-blue-500/50 bg-blue-500 text-white",
      },
    },
    defaultVariants: {
      variant: "default",
    },
  }
);
```

**বৈশিষ্ট্য:**
- সাধারণ এবং Anchored টোস্ট সাপোর্ট
- ৪টি ভেরিয়েন্ট: default, destructive, success, info
- অটো-ডিসমিস
- অ্যাকশন বাটন সাপোর্ট
- কিউ ম্যানেজমেন্ট

#### 5. Sidebar কম্পোনেন্ট (22.7KB)

```typescript
// packages/ui/src/components/sidebar.tsx
const SidebarProvider = React.forwardRef<
  HTMLDivElement,
  React.ComponentProps<"div"> & {
    defaultOpen?: boolean;
    open?: boolean;
    onOpenChange?: (open: boolean) => void;
  }
>(({ defaultOpen = true, open: openProp, onOpenChange, ...props }, ref) => {
  const [open, setOpen] = React.useState(defaultOpen);
  
  return (
    <SidebarContext.Provider value={{ open, setOpen }}>
      <div ref={ref} {...props} />
    </SidebarContext.Provider>
  );
});

const sidebarMenuButtonVariants = cva(
  "peer/menu-button flex w-full items-center gap-2 overflow-hidden rounded-lg p-2 text-left text-sm outline-hidden ring-sidebar-ring transition-[width,height,padding]",
  {
    variants: {
      variant: {
        default: "hover:bg-sidebar-accent hover:text-sidebar-accent-foreground",
        outline: "bg-background shadow-[0_0_0_1px_hsl(var(--sidebar-border))]",
      },
      size: {
        default: "h-8 text-sm",
        sm: "h-7 text-xs",
        lg: "h-12 text-sm",
      },
    },
  }
);
```

**বৈশিষ্ট্য:**
- কলাপসিবল সাইডবার
- মোবাইল ড্রয়ার মোড
- কন্টেক্সট API ব্যবহার
- কাস্টমাইজেবল ভেরিয়েন্টস

---

## 🖼️ কম্পোনেন্ট থাম্বনেইল সিস্টেম

### হোমপেইজ কার্ড প্রিভিউ কীভাবে কাজ করে

হোমপেইজে প্রতিটি কম্পোনেন্ট কার্ডের ভেতরে যে প্রিভিউ দেখা যায়, সেটি একটি **থাম্বনেইল সিস্টেম** এর মাধ্যমে তৈরি করা হয়েছে। এটি রিয়েল কম্পোনেন্ট নয়, বরং JSX দিয়ে তৈরি static UI রিপ্রেজেন্টেশন।

### থাম্বনেইল তৈরির প্রক্রিয়া

**1. বেইজ কম্পোনেন্টস:**

```typescript
// apps/ui/components/category-thumbnails.tsx
function Icon({ icon: IconComponent }) {
  return <IconComponent className="size-4 text-muted-foreground/88" />;
}

function Text({ variant = "main" }) {
  const bgColor = variant === "main" ? "bg-muted-foreground/40" : "bg-muted-foreground/20";
  return <div className={cn("h-1.5 rounded-full", bgColor)} />;
}

function Card({ children, withGradient = true }) {
  return (
    <div className="relative flex w-full max-w-72 flex-col rounded-2xl border shadow-md/5 ...">
      {children}
    </div>
  );
}
```

**2. থাম্বনেইল ম্যাপ:**

```typescript
export const categoryThumbnails: Record<string, ReactNode> = {
  accordion: accordionThumbnail,
  alert: alertThumbnail,
  "alert-dialog": alertDialogThumbnail,
  autocomplete: autocompleteThumbnail,
  avatar: avatarThumbnail,
  badge: badgeThumbnail,
  breadcrumb: breadcrumbThumbnail,
  button: buttonThumbnail,
  calendar: calendarThumbnail,
  card: cardThumbnail,
  // ... আরও ৫০+ কম্পোনেন্ট
};

export function getCategoryThumbnail(slug: string): ReactNode | undefined {
  return categoryThumbnails[slug];
}
```

**3. হোমপেইজে ব্যবহার:**

```typescript
// apps/ui/app/page.tsx
import { getCategoryThumbnail } from "@/components/category-thumbnails";
import { categories } from "@/config/categories";

export default function Page() {
  return (
    <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
      {categories.map((category) => (
        <CategoryCard
          key={category.slug}
          name={category.name}
          slug={category.slug}
          description={category.description}
          thumbnail={getCategoryThumbnail(category.slug)}
        />
      ))}
    </div>
  );
}
```

### কেন এভাবে করা হয়েছে?

| পদ্ধতি | সুবিধা | অসুবিধা |
|--------|--------|---------|
| **থাম্বনেইল (বর্তমান)** | ⚡ দ্রুত লোড, 🎨 কাস্টমাইজড look, 🪶 হালকা | ❌ রিয়েল ইন্টারঅ্যাকশন নেই |
| **রিয়েল কম্পোনেন্ট** | ✅ আসল behavior দেখা যায় | 🐌 স্লো লোড, 🔧 কমপ্লেক্স |

থাম্বনেইলগুলো **Lucide React Icons** এবং **Tailwind CSS** দিয়ে তৈরি, যা কম্পোনেন্টের মূল বৈশিষ্ট্য visual representation দেয়।

---

## 🗄️ কন্টেন্ট ম্যানেজমেন্ট (MDX)

### Fumadocs কনফিগারেশন

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

### MDX ফাইল স্ট্রাকচার

```
content/docs/
├── (root)/
│   ├── index.mdx           # হোমপেইজ ডকুমেন্টেশন
│   ├── get-started.mdx    # গেটিং স্টার্টেড
│   ├── radix-migration.mdx # Radix মাইগ্রেশন গাইড
│   ├── skills.mdx         # স্কিলস ডকুমেন্টেশন
│   ├── changelog.mdx      # চেঞ্জলগ
│   ├── roadmap.mdx        # রোডম্যাপ
│   └── meta.json          # মেটাডেটা
├── components/            # কম্পোনেন্ট ডকুমেন্টেশন
│   ├── accordion.mdx
│   ├── button.mdx
│   ├── card.mdx
│   └── ... (মোট ৫০+ ফাইল)
├── hooks/                 # হুকস ডকুমেন্টেশন
│   ├── use-copy-to-clipboard.mdx
│   └── use-media-query.mdx
└── resources/             # রিসোর্স ডকুমেন্টেশন
    ├── meta.json
    └── ...
```

### MDX ফাইল ফরম্যাট

```mdx
---
title: Button
description: ক্লিকেবল বাটন কম্পোনেন্ট
links:
  doc: https://base-ui.com/react/components/button
---

# Button

বাটন কম্পোনেন্ট ব্যবহারকারীদের একটি অ্যাকশন চালু করতে দেয়।

## Installation

```bash
npx shadcn add button
```

## Usage

```tsx
import { Button } from "@/components/ui/button";

export default function Page() {
  return <Button>Click me</Button>;
}
```

## Examples

### Variants

<ComponentPreview name="button-variants" />

### Sizes

<ComponentPreview name="button-sizes" />
```

---

## 🔐 থিম ম্যানেজমেন্ট

### ThemeProvider কনফিগারেশন

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
- `attribute="class"`: dark ক্লাস ব্যবহার করে থিম পরিবর্তন
- `defaultTheme="system"`: সিস্টেম থিম অনুযায়ী
- `enableSystem`: সিস্টেম থিম সনাক্তকরণ
- `disableTransitionOnChange`: থিম পরিবর্তনে ট্রানজিশন নিষ্ক্রিয়

### ModeSwitcher

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
    "test": "pnpm test --pass-with-no-tests",
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
    "registry:validate-deps": "tsx ./scripts/validate-registry-deps.mts",
    "ui:sync": "tsx ./scripts/sync-ui.mts && pnpm run ui:sync:imports",
    "ui:sync:imports": "cd ../.. && pnpm exec biome check --write ..."
  }
}
```

### 2. CLI কমান্ড রেফারেন্স

| কমান্ড | উদ্দেশ্য |
|--------|----------|
| `pnpm install` | ডিপেন্ডেন্সি ইনস্টল |
| `pnpm dev` | ডেভেলপমেন্ট সার্ভার চালু |
| `pnpm build` | প্রোডাকশন বিল্ড |
| `pnpm lint` | কোড লিন্টিং |
| `pnpm format` | কোড ফরম্যাটিং |
| `pnpm typecheck` | TypeScript টাইপ চেক |
| `pnpm ui:sync` | UI কম্পোনেন্টস সিঙ্ক |
| `pnpm registry:build` | রেজিস্ট্রি বিল্ড |

### 3. Git Hooks

**Husky + lint-staged:**
```javascript
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

## 🔍 SEO এবং মেটাডেটা

### Root Layout মেটাডেটা

```typescript
// apps/ui/app/layout.tsx
export const metadata: Metadata = {
  title: "FlutMan - A new, modern UI component library built on top of Base UI",
  description: "FlutMan is a collection of accessible, and composable React components. Built on top of Base UI and styled with Tailwind CSS",
  metadataBase: new URL("https://flutman.dev"),
  openGraph: {
    title: "FlutMan UI",
    description: "Modern UI component library",
    images: "/opengraph-image.png",
  },
  twitter: {
    card: "summary_large_image",
    images: "/twitter-image.png",
  },
};
```

### Sitemap

```typescript
// apps/ui/app/sitemap.ts
import { MetadataRoute } from "next";

export default function sitemap(): MetadataRoute.Sitemap {
  return [
    {
      url: "https://flutman.dev",
      lastModified: new Date(),
      changeFrequency: "yearly",
      priority: 1,
    },
    {
      url: "https://flutman.dev/particles",
      lastModified: new Date(),
      changeFrequency: "weekly",
      priority: 0.8,
    },
    // ... আরও URL
  ];
}
```

### Robots

```typescript
// apps/ui/app/robots.ts
import { MetadataRoute } from "next";

export default function robots(): MetadataRoute.Robots {
  return {
    rules: {
      userAgent: "*",
      allow: "/",
    },
    sitemap: "https://flutman.dev/sitemap.xml",
  };
}
```

---

## 📊 রেজিস্ট্রি সিস্টেম

### কম্পোনেন্ট রেজিস্ট্রি আর্কিটেকচার

```typescript
// apps/ui/registry/index.ts
export interface RegistryItem {
  name: string;
  type: "registry:ui" | "registry:lib" | "registry:hook";
  dependencies?: string[];
  registryDependencies?: string[];
  files?: string[];
  source?: string;
  category?: string;
  subcategory?: string;
  chunks?: Array<{
    name: string;
    description: string;
    file: string;
    code: string;
  }>;
}

export const registry: RegistryItem[] = [
  {
    name: "button",
    type: "registry:ui",
    dependencies: ["@base-ui/react"],
    files: ["registry/default/ui/button.tsx"],
    category: "inputs",
  },
  // ... আরও আইটেম
];
```

### রেজিস্ট্রি বিল্ড প্রক্রিয়া

```typescript
// apps/ui/scripts/build-registry.mts
export async function buildRegistry() {
  // 1. রেজিস্ট্রি ফাইল পড়া
  // 2. কম্পোনেন্ট কোড পার্স করা
  // 3. ডিপেন্ডেন্সি বিশ্লেষণ
  // 4. registry.json তৈরি
  // 5. __index__.tsx তৈরি
}
```

---

## 🚀 ডিপ্লয়মেন্ট স্ট্রাকচার

### বিল্ড আউটপুট

```
apps/ui/
├── .next/                    # Next.js বিল্ড আউটপুট
│   ├── static/              # স্ট্যাটিক ফাইল
│   ├── server/              # সার্ভার কম্পোনেন্ট
│   └── cache/               # বিল্ড ক্যাশ
├── .source/                 # Fumadocs জেনারেটেড ফাইল
└── dist/                    # প্রোডাকশন বিল্ড
```

### ডিপ্লয়মেন্ট প্ল্যাটফর্ম

| প্ল্যাটফর্ম | কনফিগারেশন |
|------------|------------|
| **Vercel** | সবচেয়ে সুপারিশন |
| **Netlify** | সম্ভব |
| **Docker** | সম্ভব |

### Vercel কনফিগারেশন

```json
// vercel.json
{
  "buildCommand": "cd apps/ui && pnpm build",
  "outputDirectory": "apps/ui/.next",
  "framework": "nextjs",
  "installCommand": "pnpm install"
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
import { cn } from "@flutman/ui/lib/utils";

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
│                   (flutman-main/)                           │
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
              │      (@flutman/ui)            │
              ├───────────────────────────────┤
              │ • 53+ Components              │
              │ • Shared Hooks                │
              │ • Custom Fonts                │
              │ • Theme Provider              │
              │ • Utility Functions           │
              └───────────────────────────────┘
                              │
                              ▼
              ┌───────────────────────────────┐
              │   packages/typescript-config  │
              │    (@flutman/typescript-config) │
              └───────────────────────────────┘
```

---

## 📋 সম্পূর্ণ কম্পোনেন্ট API রেফারেন্স

### Button API

| Prop | টাইপ | ডিফল্ট | বিবরণ |
|------|------|--------|--------|
| `variant` | `default \| destructive \| outline \| secondary \| ghost \| link` | `default` | ভিজ্যুয়াল স্টাইল |
| `size` | `default \| sm \| lg \| icon` | `default` | বাটন সাইজ |
| `asChild` | `boolean` | `false` | Polymorphic রেন্ডারিং |
| `disabled` | `boolean` | `false` | ডিজেবল্ড স্টেট |
| `loading` | `boolean` | `false` | লোডিং স্টেট |

### Card API

| Component | বিবরণ |
|-----------|--------|
| `Card` | মূল কন্টেইনার |
| `CardHeader` | হেডার সেকশন |
| `CardTitle` | টাইটেল |
| `CardDescription` | বর্ণনা |
| `CardContent` | মূল কন্টেন্ট |
| `CardFooter` | ফুটার সেকশন |

### Dialog API

| Component | বিবরণ |
|-----------|--------|
| `Dialog` | রুট কম্পোনেন্ট |
| `DialogTrigger` | ট্রিগার এলিমেন্ট |
| `DialogContent` | মোডাল কন্টেন্ট |
| `DialogHeader` | হেডার সেকশন |
| `DialogTitle` | টাইটেল |
| `DialogDescription` | বর্ণনা |
| `DialogFooter` | ফুটার সেকশন |
| `DialogClose` | ক্লোজ বাটন |

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
   - React 19 ফিচারস

3. **ডিজাইন সিস্টেম তৈরি**
   - Tailwind CSS v4
   - CSS ভেরিয়েবল
   - থিমিং
   - অ্যানিমেশন

4. **UI কম্পোনেন্ট লাইব্রেরি**
   - Base UI প্রিমিটিভ
   - CVA (class-variance-authority)
   - কম্পোজেবল API
   - টাইপ সেফটি

5. **ডকুমেন্টেশন সাইট**
   - Fumadocs
   - MDX
   - কোড হাইলাইটিং
   - কম্পোনেন্ট প্রিভিউ

6. **কোড কোয়ালিটি**
   - TypeScript
   - Biome
   - Git Hooks
   - Lint-staged

---

## 📞 সাপোর্ট এবং রিসোর্স

### অফিসিয়াল লিংক:
- **ওয়েবসাইট:** https://flutman.vercel.app
- **UI ডকুমেন্টেশন:** https://flutman.vercel.app/docs
- **GitHub:** https://github.com/CerebralCEO/FluttMan-Flutter-UI-Library

### ডকুমেন্টেশন:
- **README.md**: প্রোজেক্ট ওভারভিউ
- **AGENTS.md**: AI এজেন্ট গাইডলাইনস
- **CONTRIBUTING.md**: কন্ট্রিবিউশন গাইড
- **project_overview.md**: এই ফাইল - সম্পূর্ণ ডকুমেন্টেশন

---

## 🎓 পরিশিষ্ট

এই ডকুমেন্টেশনে FlutMan UI প্রোজেক্টের সম্পূর্ণ A থেকে Z বিশ্লেষণ অন্তর্ভুক্ত করা হয়েছে। এই প্রোজেক্ট একটি sophisticated মনোরেপো যা আধুনিক React, Next.js, এবং Tailwind CSS ব্যবহার করে একটি শক্তিশালী UI কম্পোনেন্ট লাইব্রেরি তৈরি করেছে।

**সংক্ষিপ্ত তথ্য:**
- **প্রোজেক্ট নাম:** FlutMan UI
- **টেক স্ট্যাক:** Next.js 16, React 19, TypeScript 5.9, Tailwind CSS 4, pnpm
- **আর্কিটেকচার:** Turborepo মনোরেপো
- **UI লাইব্রেরি:** Base UI প্রিমিটিভ
- **ডকুমেন্টেশন:** Fumadocs MDX
- **লাইসেন্স:** MIT (apps/ui), AGPL-3.0 (packages/ui)

---

*ডকুমেন্টেশন তৈরির তারিখ: ২৫ এপ্রিল, ২০২৬*  
*সর্বশেষ আপডেট: ২৫ এপ্রিল, ২০২৬*
