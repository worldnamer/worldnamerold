LifeArea.where(name: 'heart', icon: 'fa-heart').first_or_create
LifeArea.where(name: 'body', icon: 'fa-bicycle').first_or_create
LifeArea.where(name: 'mind', icon: 'fa-lightbulb-o').first_or_create
LifeArea.where(name: 'people', icon: 'fa-users').first_or_create
LifeArea.where(name: 'impact', icon: 'fa-connectdevelop').first_or_create
LifeArea.where(name: 'wealth', icon: 'fa-building').first_or_create
LifeArea.where(name: 'energy', icon: 'fa-bolt').first_or_create

Term.where(name: 'month', days: 30).first_or_create
Term.where(name: 'quarter', days: 90).first_or_create
Term.where(name: 'year', days: 365).first_or_create