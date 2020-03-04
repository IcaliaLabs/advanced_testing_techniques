## Test best practices

In this video, we will cover five tips that will radically improve the way you write your tests.

### 4 phase test

This pattern applies for all programming languages out there and unit tests. It looks like this:

```ruby
it do
  setup
  exercise
  verify
  teardown
end
```

#### Setup

The setup step is where you prepare everything you will need for your test to actually run.

```ruby
it do
  user = FactoryBot.create(:user)

  exercise
  verify
  teardown
end
```

#### Exercise

On the exercise, is where you trigger the action to test.

```ruby
it do
  user = FactoryBot.create(:user)

  user.pay_subscription

  verify
  teardown
end
```

#### Verify

The verify step is where you expect an output or the result

```ruby
it do
  user = FactoryBot.create(:user)

  user.pay_subscription

  expect(user).to be_premium
  teardown
end
```

#### Teardown

During the last step, the system goes to day 1, in other words, resets the database, releases memory and cleans up eveything.

In Ruby, this last step is performed by Ruby itself and rspec or minitest automatically.
