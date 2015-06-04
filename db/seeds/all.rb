LifeArea.where(name: 'heart').first_or_create
LifeArea.where(name: 'body').first_or_create
LifeArea.where(name: 'mind').first_or_create
LifeArea.where(name: 'people').first_or_create
LifeArea.where(name: 'impact').first_or_create
LifeArea.where(name: 'wealth').first_or_create
LifeArea.where(name: 'energy').first_or_create

Term.where(name: 'month', days: 30).first_or_create
Term.where(name: 'quarter', days: 90).first_or_create
Term.where(name: 'year', days: 365).first_or_create