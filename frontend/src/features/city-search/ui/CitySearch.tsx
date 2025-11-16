import React, { useState, useRef, useEffect } from 'react';
import { rosatomCities } from '@/shared/lib/constants';
import styles from './CitySearch.module.css';

export const CitySearch: React.FC = () => {
  const [query, setQuery] = useState('');
  const [suggestions, setSuggestions] = useState<string[]>([]);
  const [showSuggestions, setShowSuggestions] = useState(false);
  const suggestionsRef = useRef<HTMLUListElement>(null);

  const updateSuggestions = (searchQuery: string) => {
    const q = searchQuery.trim().toLowerCase();
    if (!q) {
      setSuggestions(rosatomCities);
      setShowSuggestions(true);
      return;
    }

    const filtered = rosatomCities.filter(city =>
      city.toLowerCase().startsWith(q)
    );

    setSuggestions(filtered);
    setShowSuggestions(filtered.length > 0);
  };

  const handleInputChange = (value: string) => {
    setQuery(value);
    updateSuggestions(value);
  };

  const handleCitySelect = (city: string) => {
    setQuery(city);
    setShowSuggestions(false);
  };

  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (suggestionsRef.current && !suggestionsRef.current.contains(event.target as Node)) {
        setShowSuggestions(false);
      }
    };

    document.addEventListener('click', handleClickOutside);
    return () => document.removeEventListener('click', handleClickOutside);
  }, []);

  return (
    <div className={styles.cityBlock}>
      <input
        className={styles.input}
        placeholder="Выбрать город"
        value={query}
        onChange={(e) => handleInputChange(e.target.value)}
        onFocus={() => updateSuggestions(query)}
      />
      {showSuggestions && (
        <ul ref={suggestionsRef} className={styles.citySuggestions}>
          {suggestions.map(city => (
            <li key={city} onClick={() => handleCitySelect(city)}>
              {city}
            </li>
          ))}
        </ul>
      )}
    </div>
  );
};