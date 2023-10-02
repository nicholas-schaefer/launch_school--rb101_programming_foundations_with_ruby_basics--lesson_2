loan_amount               = 5_000.0
monthly_interest_rate     = 1.5e-2 / 12
loan_duration_in_months   = 12.0

monthly_payment = \
  loan_amount * monthly_interest_rate / \
  (1 - ((1 + monthly_interest_rate)**(-loan_duration_in_months)))

p monthly_payment.round(2)
