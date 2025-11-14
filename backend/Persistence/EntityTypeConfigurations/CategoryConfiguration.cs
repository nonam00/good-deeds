using Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Persistence.EntityTypeConfigurations;

public class CategoryConfiguration : IEntityTypeConfiguration<Category>
{
    public void Configure(EntityTypeBuilder<Category> builder)
    {
        builder.HasKey(c => c.Id);
        
        builder.Property(c => c.Title)
            .IsRequired()
            .HasMaxLength(255);

        string[] categoriesStringList =
        [
            "Местное сообщество и развитие территорий",
            "Социальная защита (помощь людям в трудной ситуации)",
            "Экология и устойчивое развитие",
            "Здоровье и спорт",
            "Культура и образование",
            "Защита животных",
            "Другое"
        ];

        var categories = categoriesStringList.Select(Category.Create);
        builder.HasData(categories);
    }
}