# Mahfazty — Core Domain Modules

This document defines the core business/domain entities for the Mahfazty personal finance application.

# 1. User

Represents the owner of the Mahfazty financial data.

| Attribute | Type | Required | Description |
|---|---|---:|---|
| `id` | String/UUID | Yes | Unique user identifier |
| `name` | String | Yes | User's display/full name |
| `email` | String | No | User email address |
| `phone` | String | No | User phone number |
| `language` | String | Yes | Preferred application language |
| `createdAt` | DateTime | Yes | User creation date |
| `updatedAt` | DateTime | Yes | Last update date |
| `profileImage` | String | No | Local path or URL for profile image |
| `defaultCurrency` | String | Yes | Default currency code, e.g. `EGP`, `USD` |
| `country` | String | No | User's country |

### Notes

For a local-first MVP, Mahfazty can support a single local user profile. Authentication fields can be expanded later if cloud synchronization is introduced.

---

# 2. Account

Represents a place where money is stored or managed.

Examples:

- Cash
- Bank Account
- Savings Account
- E-Wallet
- Credit Card

| Attribute | Type | Required | Description |
|---|---|---:|---|
| `id` | String/UUID | Yes | Unique account identifier |
| `userId` | String/UUID | Yes | Owner of the account |
| `name` | String | Yes | Account name |
| `type` | Enum | Yes | Account type |
| `balance` | Decimal | Yes | Current calculated/displayed balance |
| `currency` | String | Yes | Account currency |
| `description` | String | No | Optional account description |
| `isActive` | Boolean | Yes | Whether the account is active |
| `createdAt` | DateTime | Yes | Creation date |
| `updatedAt` | DateTime | Yes | Last update date |

### Account Type

```text
cash
bank
savings
eWallet
creditCard
other
```

### Important Rule

An account balance should be derived consistently from:

```text
initialBalance
+ income
- expenses
+ incoming transfers
- outgoing transfers
```

Avoid allowing arbitrary balance modifications without recording the corresponding financial operation.

---

# 3. Transaction

Represents an actual financial operation.

Transaction types:

```text
income
expense
transfer
```

Income and expenses should be represented by one unified Transaction entity rather than completely separate entities.

| Attribute | Type | Required | Description |
|---|---|---:|---|
| `id` | String/UUID | Yes | Unique transaction identifier |
| `userId` | String/UUID | Yes | Transaction owner |
| `accountId` | String/UUID | Yes | Account affected by the transaction |
| `categoryId` | String/UUID | Conditional | Category associated with income/expense |
| `type` | Enum | Yes | `income`, `expense`, or `transfer` |
| `amount` | Decimal | Yes | Transaction amount |
| `date` | DateTime | Yes | Date/time of transaction |
| `title` | String | No | Short transaction title |
| `description` | String | No | Additional details |
| `note` | String | No | User note |
| `transferAccountId` | String/UUID | Conditional | Destination/source account for transfers |
| `attachmentPath` | String | No | Local receipt/file path |
| `createdAt` | DateTime | Yes | Creation date |
| `updatedAt` | DateTime | Yes | Last update date |

### Transaction Type

```text
income
expense
transfer
```

### Income Example

```text
type: income
amount: 15000
accountId: CIB
categoryId: Salary
```

### Expense Example

```text
type: expense
amount: 500
accountId: Cash
categoryId: Food
```

### Transfer Example

```text
type: transfer
amount: 5000
accountId: CIB
transferAccountId: Cash
```

A transfer should not be counted as either income or expense.

---

# 4. Category

Classifies income and expense transactions.

Examples:

```text
Food
Transportation
Shopping
Bills
Entertainment
Salary
Freelance
Business
```

| Attribute | Type | Required | Description |
|---|---|---:|---|
| `id` | String/UUID | Yes | Unique category identifier |
| `name` | String | Yes | Category name |
| `type` | Enum | Yes | `income` or `expense` |
| `parentId` | String/UUID | No | Parent category for subcategories |
| `icon` | String | No | Category icon identifier |
| `color` | Integer/String | No | Category display color |
| `description` | String | No | Category description |
| `createdAt` | DateTime | Yes | Creation date |
| `updatedAt` | DateTime | Yes | Last update date |

### Category Type

```text
income
expense
```

### Example Hierarchy

```text
Food
├── Groceries
├── Restaurants
├── Coffee
└── Delivery

Transportation
├── Fuel
├── Taxi
├── Public Transport
└── Maintenance
```

`parentId = null` represents a root category.

---

# 5. Recurring Transaction

Represents a rule/template used to generate transactions repeatedly.

Examples:

- Monthly salary
- Monthly rent
- Internet bill
- Netflix subscription
- Weekly allowance

This should be separate from `Transaction`.

A recurring transaction is a **schedule/template**, while a transaction is an **actual financial event**.

| Attribute | Type | Required | Description |
|---|---|---:|---|
| `id` | String/UUID | Yes | Unique recurring transaction identifier |
| `userId` | String/UUID | Yes | Owner |
| `accountId` | String/UUID | Yes | Account affected |
| `categoryId` | String/UUID | Conditional | Category |
| `type` | Enum | Yes | `income` or `expense` |
| `amount` | Decimal | Yes | Amount to generate |
| `title` | String | Yes | Transaction title |
| `description` | String | No | Description |
| `frequency` | Enum | Yes | Recurrence frequency |
| `interval` | Integer | Yes | Repeat every N units |
| `startDate` | DateTime | Yes | Recurrence start |
| `endDate` | DateTime | No | Optional recurrence end |
| `isActive` | Boolean | Yes | Whether recurrence is active |
| `createdAt` | DateTime | Yes | Creation date |
| `updatedAt` | DateTime | Yes | Last update date |

### Frequency

```text
daily
weekly
monthly
yearly
```

The `interval` allows schedules such as:

```text
every 1 month
every 2 weeks
every 3 months
```

### Example

```text
title: Salary
type: income
amount: 15000
frequency: monthly
interval: 1
nextOccurrence: 2026-10-01
autoCreate: true
```

When the occurrence happens, Mahfazty creates a normal `Transaction` and keeps the recurring rule for the next occurrence.

---

# 6. Reminder

Represents a scheduled notification/reminder for a financial event.

Examples:

- Pay electricity bill
- Pay rent
- Credit card payment
- Debt payment
- Savings reminder

| Attribute | Type | Required | Description |
|---|---|---:|---|
| `id` | String/UUID | Yes | Unique reminder identifier |
| `userId` | String/UUID | Yes | Reminder owner |
| `title` | String | Yes | Reminder title |
| `description` | String | No | Reminder details |
| `amount` | Decimal | No | Optional amount associated with reminder |
| `date` | DateTime | Yes | Reminder date/time |
| `repeat` | Enum | Yes | Recurrence setting |
| `accountId` | String/UUID | No | Related account |
| `categoryId` | String/UUID | No | Related category |
| `transactionId` | String/UUID | No | Related transaction |
| `recurringTransactionId` | String/UUID | No | Related recurring transaction |
| `isCompleted` | Boolean | Yes | Whether reminder was completed |
| `isActive` | Boolean | Yes | Whether reminder is active |
| `notificationEnabled` | Boolean | Yes | Whether notification should be sent |
| `createdAt` | DateTime | Yes | Creation date |
| `updatedAt` | DateTime | Yes | Last update date |

### Reminder Repeat

```text
none
daily
weekly
monthly
yearly
```

---

# Relationships

The main relationships are:

```text
User
 │
 ├───────────────< Account
 │
 ├───────────────< Category
 │
 ├───────────────< Transaction
 │
 ├───────────────< RecurringTransaction
 │
 └───────────────< Reminder


Account
 │
 └───────────────< Transaction


Category
 │
 └───────────────< Transaction


RecurringTransaction
 │
 └───────────────< Transaction


Reminder
 ├───────────────> Account       (optional)
 ├───────────────> Category      (optional)
 ├───────────────> Transaction   (optional)
 └───────────────> RecurringTransaction (optional)
```

---

# Entity Relationship Overview

```text
                         ┌─────────────┐
                         │    USER     │
                         └──────┬──────┘
                                │
            ┌───────────────────┼────────────────────┐
            │                   │                    │
            ▼                   ▼                    ▼
      ┌───────────┐       ┌───────────┐      ┌──────────────┐
      │  ACCOUNT  │       │ CATEGORY  │      │   REMINDER   │
      └─────┬─────┘       └─────┬─────┘      └──────────────┘
            │                   │
            │                   │
            └─────────┬─────────┘
                      ▼
               ┌─────────────┐
               │ TRANSACTION │
               └──────┬──────┘
                      ▲
                      │
               ┌──────┴─────────────┐
               │ RECURRING          │
               │ TRANSACTION         │
               └────────────────────┘
```

---

# Recommended Enums

## TransactionType

```dart
enum TransactionType {
  income,
  expense,
  transfer,
}
```

## CategoryType

```dart
enum CategoryType {
  income,
  expense,
}
```

## AccountType

```dart
enum AccountType {
  cash,
  bank,
  savings,
  eWallet,
  creditCard,
  other,
}
```

## RecurrenceFrequency

```dart
enum RecurrenceFrequency {
  daily,
  weekly,
  monthly,
  yearly,
}
```

## ReminderRepeat

```dart
enum ReminderRepeat {
  none,
  daily,
  weekly,
  monthly,
  yearly,
}
```

---

# Core Business Rules

### Transaction

```text
Income:
    increases account balance

Expense:
    decreases account balance

Transfer:
    decreases source account
    increases destination account
```

### Category

```text
Income transaction → Income category
Expense transaction → Expense category

Transfer → No category required
```

### Recurring Transaction

```text
RecurringTransaction
        ↓
Scheduled occurrence
        ↓
Normal Transaction
        ↓
Next occurrence calculated
```

### Account

Account balance should be calculated consistently from the account's initial balance and its transactions.

### Reminder

A reminder is not itself a financial transaction unless it is explicitly converted into/linked to a transaction.

---

# MVP Priority

## Phase 1 — Essential

```text
User
Account
Transaction
Category
```

These are the minimum entities required for:

- Income
- Expenses
- Transfers
- Account balances
- Categories
- Transaction history
- Basic dashboard
- Basic reports

## Phase 2

```text
RecurringTransaction
Reminder
```

These add:

- Recurring income
- Recurring expenses
- Scheduled payments
- Notifications
- Upcoming financial events

## Future Modules

The architecture can later be extended with:

```text
Budget
Goal
Debt
Loan
CreditCard
Subscription
Asset
Liability
Investment
Receipt
Tag
```

These should be added when their business requirements are defined rather than overloading the initial database design.
