# Habit App - UX Wireframe Descriptions

## Design System

### Color Palette

**Light Theme:**
- Primary: `#6366F1` (Indigo)
- Primary Variant: `#4F46E5`
- Secondary: `#10B981` (Emerald - for success/completed)
- Background: `#FFFFFF`
- Surface: `#F9FAFB`
- Text Primary: `#111827`
- Text Secondary: `#6B7280`
- Error: `#EF4444`
- Warning: `#F59E0B`

**Dark Theme:**
- Primary: `#818CF8`
- Primary Variant: `#6366F1`
- Secondary: `#34D399`
- Background: `#111827`
- Surface: `#1F2937`
- Text Primary: `#F9FAFB`
- Text Secondary: `#9CA3AF`
- Error: `#F87171`
- Warning: `#FBBF24`

### Typography

- **Headings (H1)**: 28px, Bold (weight 700)
- **Headings (H2)**: 24px, SemiBold (weight 600)
- **Headings (H3)**: 20px, SemiBold (weight 600)
- **Body**: 16px, Regular (weight 400)
- **Body Small**: 14px, Regular (weight 400)
- **Caption**: 12px, Regular (weight 400)
- **Button**: 16px, SemiBold (weight 600)

### Spacing System (8pt Grid)

- xs: 4px
- sm: 8px
- md: 16px
- lg: 24px
- xl: 32px
- xxl: 48px

### Border Radius

- Small: 8px (buttons, chips)
- Medium: 12px (cards, inputs)
- Large: 16px (modals, sheets)
- Full: 9999px (avatars, FABs)

---

## Screen 1: Login Page

### Layout Structure

```
┌─────────────────────────────────┐
│         Status Bar               │
├─────────────────────────────────┤
│                                 │
│         [Logo/App Icon]         │
│           80x80px               │
│                                 │
│         "Habit App"             │
│         H1, centered            │
│                                 │
│    ┌─────────────────────┐      │
│    │  Email Address      │      │
│    │  input field        │      │
│    └─────────────────────┘      │
│    ┌─────────────────────┐      │
│    │  Password           │      │
│    │  input field        │      │
│    └─────────────────────┘      │
│                                 │
│    [ ] Remember me             │
│                                 │
│    ┌─────────────────────┐      │
│    │      Login         │      │
│    │   Primary Button   │      │
│    └─────────────────────┘      │
│                                 │
│    Don't have an account?      │
│    [Register] (text button)    │
│                                 │
└─────────────────────────────────┘
```

### UI Elements

1. **App Icon**: Centered, 80x80px, with subtle shadow
2. **Title**: "Habit App" - H1, centered, Primary color
3. **Email Input**: Full-width, 56px height, border-radius 12px, placeholder "Email address"
4. **Password Input**: Full-width, 56px height, border-radius 12px, obscure text toggle icon
5. **Remember Me**: Checkbox + text, left-aligned
6. **Login Button**: Full-width, 56px height, Primary color background, white text, border-radius 12px
7. **Register Link**: Text button below, secondary text color

### Interactions

- Tap email field → keyboard appears, field focused (primary border)
- Tap password field → keyboard appears, field focused
- Tap eye icon �� toggle password visibility
- Tap Login → validate, show loading spinner, navigate or show error
- Tap Register → navigate to Registration page

### Error States

- Invalid email: Red border, error text below field "Please enter a valid email"
- Empty password: Red border, error text "Password is required"
- Wrong credentials: Red border on both fields, error text "Invalid email or password"

---

## Screen 2: Registration Page

### Layout Structure

```
┌─────────────────────────────────┐
│         Status Bar               │
├─────────────────────────────────┤
│  ← Back                    [?]  │
├─────────────────────────────────┤
│                                 │
│         "Create Account"        │
│         H1, centered            │
│                                 │
│    ┌─────────────────────┐      │
│    │  Full Name         │      │
│    └─────────────────────┘      │
│    ┌─────────────────────┐      │
│    │  Email Address     │      │
│    └─────────────────────┘      │
│    ┌─────────────────────┐      │
│    │  Password          │      │
│    └─────────────────────┘      │
│    ┌─────────────────────┐      │
│    │  Confirm Password  │      │
│    └─────────────────────┘      │
│                                 │
│    ┌─────────────────────┐      │
│    │   Create Account   │      │
│    │   Primary Button   │      │
│    └─────────────────────┘      │
│                                 │
│    Already have an account?    │
│    [Log in] (text button)      │
│                                 │
└─────────────────────────────────┘
```

### UI Elements

1. **Back Arrow**: Top-left, 24px icon, navigates back
2. **Title**: "Create Account" - H1, centered
3. **Name Input**: Full-width, 56px height, border-radius 12px
4. **Email Input**: Full-width, 56px height, border-radius 12px
5. **Password Input**: Full-width, 56px height, show/hide toggle
6. **Confirm Password**: Full-width, 56px height, show/hide toggle
7. **Create Button**: Full-width, 56px height, Primary color
8. **Login Link**: Text button below

### Validation Messages

- Name empty: "Name is required"
- Email invalid: "Please enter a valid email"
- Password too short: "Password must be at least 6 characters"
- Passwords don't match: "Passwords do not match"

---

## Screen 3: Home Page

### Layout Structure

```
┌─────────────────────────────────┐
│  ≡            Habit App      ⚙  │
├─────────────────────────────────┤
│                                 │
│    Good morning, [User Name]!   │
│    H2                           │
│                                 │
│    ┌─────────────────────┐     │
│    │  "Daily Quote"      │     │
│    │  Quote card         │     │
│    │  - quote text       │     │
│    │  - author           ��     │
│    └─────────────────────┘     │
│                                 │
│    Today's Progress            │
│    H3                          │
│    ┌────────┐ ┌────────┐      │
│    │  75%   │ │  3/4    │      │
│    │ circle │ │tasks   │      │
│    │ chart  │ │        │      │
│    └────────┘ └────────┘      │
│                                 │
│    Recent Tasks                │
│    [View All] →               │
│    ─────────────────────       │
│    ☑ Task 1            10:30am │
│    ☑ Task 2             9:15am│
│    ☐ Task 3             8:00am │
│                                 │
│                         [+] FAB│
└─────────────────────────────────┘
```

### UI Elements

1. **Hamburger Menu**: Top-left, 24px icon
2. **App Title**: "Habit App" - H3, centered
3. **Settings Icon**: Top-right, 24px icon
4. **Welcome Text**: Dynamic greeting + user name, H2
5. **Quote Card**: Elevated card, 100px height, italic quote text, author name right-aligned
6. **Progress Circle**: 120px diameter, percentage in center, Primary color arc
7. **Task Count**: "3/4 tasks" text below circle
8. **Section Header**: "Recent Tasks" + "View All" link
9. **Task List Items**: Checkbox + task title + timestamp, swipe actions
10. **FAB**: Bottom-right, 56px, Primary color, plus icon

---

## Screen 4: Menu Drawer

### Layout Structure

```
┌──────────────────┐
│  ≡            ✕ │
├──────────────────┤
│                  │
│    [Avatar]      │
│    User Name     │
│    user@email    │
│                  │
├──────────────────┤
│    🏠 Home       │
│    ✓ Tasks       │
│    📊 Reports   │
│    👤 Profile   │
│    ⚙ Settings  │
│    🚪 Logout    │
└──────────────────┘
```

### UI Elements

1. **Close Button**: Top-right, 24px
2. **User Avatar**: 80x80px, circular, default initials if no image
3. **User Name**: H3
4. **User Email**: Body Small, secondary color
5. **Menu Items**: 56px height each, icon (24px) + label, divider between
6. **Active State**: Primary color background at 10% opacity, Primary color text

---

## Screen 5: Tasks List

### Layout Structure

```
┌─────────────────────────────────┐
│  ←            Tasks          [+] │
├─────────────────────────────────┤
│                                 │
│  [All] [Today] [Weekly] [Done]  │
│  ─────────────────────────────  │
│                                 │
│  ┌─────────────────────────┐   │
│  │ ☐ Morning Exercise      │   │
│  │    📅 Daily      🔔    │   │
│  └─────────────────────────┘   │
│                                 │
│  ┌─────────────────────────┐   │
│  │ ☑ Read 10 pages        │   │
│  │    📅 Daily      ✓     │   │
│  │       Completed 9:30am │   │
│  └─────────────────────────┘   │
│                                 │
│  ┌─────────────────────────┐   │
│  │ ☐ Meditate 5 min        │   │
│  │    📅 Daily      🔔    │   │
│  └─────────────────────────┘   │
│                                 │
└─────────────────────────────────┘
```

### UI Elements

1. **Back Button**: Top-left
2. **Title**: "Tasks" - H2
3. **Add Button**: Top-right, 24px icon
4. **Filter Tabs**: Horizontal scroll, pill-shaped selected state
5. **Task Cards**: Elevated surface, 72px height, checkbox + title + frequency icon + reminder icon, swipe reveals delete
6. **Empty State**: Illustration + "No tasks yet" + "Add your first task" button

---

## Screen 6: Task Detail / Add Task

### Layout Structure (Add/Edit)

```
┌─────────────────────────────────┐
│  ←       Add Task          Save │
├─────────────────────────────────┤
│                                 │
│    Task Title                   │
│    ┌─────────────────────┐      │
│    │                    │      │
│    └─────────────────────┘      │
│                                 │
│    Description                  │
│    ┌─────────────────────┐      │
│    │                    │      │
│    │                    │      │
│    │                    │      │
│    └─────────────────────┘      │
│                                 │
│    Frequency                    │
│    [Daily] [Weekly] [Monthly]  │
│                                 │
│    Reminder Time                 │
│    ┌─────────────────────┐      │
│    │   🕐 8:00 AM     │      │
│    └─────────────────────┘      │
│                                 │
│    Color                        │
│    ● ● ● ● ● ●               │
│                                 │
└─────────────────────────────────┘
```

### UI Elements

1. **Title Input**: Full-width, 56px
2. **Description Input**: Multi-line, 120px height, 4 lines visible
3. **Frequency Tabs**: Toggle buttons (single selection)
4. **Reminder Time**: Time picker row, tappable
5. **Color Picker**: 5 colored circles, 32px each, single selection highlight
6. **Save Button**: Top-right, text button

---

## Screen 7: Reports Page

### Layout Structure

```
┌─────────────────────────────────┐
│  ←          Reports             │
├─────────────────────────────────┤
│                                 │
│  [Day] [Week] [Month]          │
│  ─────────────────────────────  │
│                                 │
│    Productivity Overview      │
│    ─────────────────────────   │
│    ┌─────────────────────┐     │
│    │    Bar Chart      │     │
│    │    7 days       │     │
│    │    M T W T F S S │     │
│    └─────────────────────┘     │
│                                 │
│    Summary                      │
│    ┌────────┐ ┌────────┐      │
│    │  21    │ │ 85%   │      │
│    │  Total │ │Rate   │      │
│    └────────┘ └────────┘      │
│                                 │
│    Completed Tasks             │
│    ─────────────────────────   │
│    • Task 1 - 5 days ago      │
│    • Task 2 - 1 week ago      │
│                                 │
└─────────────────────────────────┘
```

### UI Elements

1. **Period Tabs**: Day/Week/Month toggle
2. **Bar Chart**: 7 bars for week view, shows daily completion
3. **Summary Cards**: Two cards side by side - total tasks, completion rate
4. **Completed List**: Bullet points with task name and relative date

---

## Screen 8: Settings Page

### Layout Structure

```
┌─────────────────────────────────┐
│  ←          Settings            │
├─────────────────────────────────┤
│                                 │
│    Appearance                   │
│    ─────────────────────────   │
│    Dark Mode            [═══●] │
│                                 │
│    Notifications               │
│    ─────────────────────────   │
│    Push Notifications   [═══●] │
│    Daily Reminder       [═══●] │
│    Reminder Time      8:00 AM │
│                                 │
│    Account                     │
│    ─────────────────────────   │
│    Change Password       [>]    │
│    Delete Account       [>]    │
│                                 │
│           Version 1.0.0        │
│                                 │
└──────────────────────────��─��────┘
```

### UI Elements

1. **Sections**: Grouped settings with section headers
2. **Toggle Switches**: iOS-style switches for boolean settings
3. **Navigation Rows**: Label + chevron icon, tappable
4. **Version Text**: Caption, centered, bottom

---

## Screen 9: Profile Page

### Layout Structure

```
┌─────────────────────────────────┐
│  ←          Profile        Edit  │
├─────────────────────────────────┤
│                                 │
│         [Avatar]                 │
│         120x120px               │
│         [Change Photo]          │
│                                 │
│         John Doe                │
│         H2, centered            │
│                                 │
│    ┌─────────────────────┐      │
│    │  Email             │      │
│    │  john@example.com  │      │
│    └─────────────────────┘      │
│    ┌─────────────────────┐      │
│    │  Member Since      │      │
│    │  January 2025     │      │
│    └─────────────────────┘      │
│                                 │
│    Stats                        │
│    ─────────────────────────   │
│    🔥  45 day streak          │
│    ✓  156 completed          │
│                                 │
└─────────────────────────────────┘
```

### UI Elements

1. **Avatar**: 120x120px, circular, with edit overlay on tap
2. **Change Photo Button**: Below avatar, text button
3. **User Name**: H2, centered, editable in edit mode
4. **Info Cards**: Label + value, read-only display
5. **Stats Row**: Icon + stat value, centered

---

## Screen 10: Notifications/Reminder Settings

### Layout Structure

```
┌─────────────────────────────────┐
│  ←       Notifications          │
├─────────────────────────────────┤
│                                 │
│    Enable Notifications         │
│    ─────────────────────────   │
│    [═●] Push Notifications     │
│                                 │
│    Daily Reminder              │
│    ─────────────────────────   │
│    [═●] Enable               │
│    Time            8:00 AM   │
│    Repeat     Every Day       [>]│
│                                 │
│    Calendar                    │
│    ─────────────────────────   │
│    [ Mini Calendar View ]     │
│    (Shows dates with tasks)   │
│                                 │
│    Upcoming                    │
│    ─────────────────────────   │
│    • Today 8:00 AM - Task    │
│    • Tomorrow 8:00 AM - Task │
│                                 │
└─────────────────────────────────┘
```

### UI Elements

1. **Master Toggle**: Enable/disable all notifications
2. **Daily Reminder Section**: Toggle + time picker + repeat options
3. **Mini Calendar**: 200px height, dots indicate days with reminders
4. **Upcoming List**: Chronological list of scheduled notifications

---

## Navigation Flow Diagram

```
                    ┌──────────────┐
                    │   Splash    │
                    └──────┬─────┘
                           │
                           ▼
                    ┌──────────────┐
         ┌─────────►│ Login Page  │◄────────┐
         │          └──────┬─────┘        │
         │                 │             │
         │                 ▼             │
         │          ┌──────────────┐    │
         │          │Registration │    │
         │          └──────┬─────┘    │
         │                 │           │
         └─────────────────┴───────────┘
                           │
                           ▼
                    ┌──────────────┐
         ┌─────────│  Home Page   │◄────────┐
         │          └──────┬─────┘        │
         │                 │              │
         │    ┌────────────┼────────┐     │
         │    │           │        │     │
         ▼    ▼           ▼        ▼     ▼
    ┌─────────┐  ┌──────┐ ┌────┐ ┌──────┐
    │ Tasks   │  │Menu │ │Prof│ │Settings
    │ List   │  │Draw │ │ile │ └──────┘
    └────┬────┘  └─────┘ └────┘
         │
         ▼
    ┌──────────┐
    │ Task     │
    │ Detail   │
    └──────────┘
```

---

## Component Library

### Buttons

| Name | Height | Radius | Background | Text |
|------|--------|--------|------------|------|
| Primary | 56px | 12px | Primary | White, 16px, 600 |
| Secondary | 56px | 12px | Transparent | Primary, 16px, 600 |
| Text | 44px | 8px | Transparent | Primary, 14px, 500 |
| FAB | 56px | Full | Primary | White, 24px |

### Inputs

| Name | Height | Radius | Border | Background |
|------|--------|--------|--------|-------------|
| Input | 56px | 12px | 1px secondary | Surface |
| Input Focused | 56px | 12px | 2px primary | Surface |
| Input Error | 56px | 12px | 2px error | Surface |

### Cards

| Name | Padding | Radius | Elevation | Background |
|------|---------|--------|----------|-----------|
| Standard | 16px | 12px | 2dp | Surface |
| Elevated | 16px | 16px | 4dp | Surface |
| Quote | 16px | 12px | 1dp | Primary at 5% |

### Lists

| Name | Height | Padding | Divider |
|------|--------|---------|---------|
| List Item | 72px | 16px horizontal | 1px bottom |
| Menu Item | 56px | 16px horizontal | none |
| Section Header | 48px | 16px horizontal | none |