import React from 'react';
import { useOrgsStore } from '@/stores/orgs-store';
import styles from './FilterItem.module.css';

interface FilterItemProps {
  filter: {
    name: string;
    icon: string;
  };
}

export const FilterItem: React.FC<FilterItemProps> = ({ filter }) => {
  const { activeFilters, toggleFilter } = useOrgsStore();
  const isActive = activeFilters.has(filter.name);

  return (
    <div className={styles.filterItem}>
      <button
        type="button"
        className={`${styles.filterBtn} ${isActive ? styles.active : ''}`}
        onClick={() => toggleFilter(filter.name)}
      >
        <span className="material-icons">{filter.icon}</span>
      </button>
      <div className={styles.filterLabel}>{filter.name}</div>
    </div>
  );
};