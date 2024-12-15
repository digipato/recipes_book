from django.db import models

class Author(models.Model):
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)

class Recipe(models.Model):
    title = models.CharField(max_length=100)
    execution = models.TextField()
    execution_time = models.TextField()
    person_number = models.IntegerField()
    # noinspection PyTypeChecker
    author = models.ForeignKey(
        Author,
        related_name='author',
        null=True,
        on_delete=models.SET_NULL()
    )
    quote = models.TextField()

class Ingredient(models.Model):
    ingredient = models.CharField(max_length=100)
    amount = models.FloatField()
    recipe = models.ForeignKey(Recipe, on_delete=models.CASCADE)
    def __str__(self):
        return self.ingredient
    class Meta:
        verbose_name_plural = "Ingredients"
        ordering = ['amount']