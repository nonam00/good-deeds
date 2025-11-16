import React from 'react';
import { useOrgsStore } from '@/stores/orgs-store';
import { Input } from '@/shared/ui/Input/Input';
import { FilterItem } from '@/features/filters/ui/FilterItem';
import { OrgCard } from '@/features/orgs/ui/OrgCard';
import { Button } from '@/shared/ui/Button/Button';
import styles from './Sidebar.module.css';

export const Sidebar: React.FC = () => {
  const { filters, searchQuery, setSearchQuery, filteredOrgs } = useOrgsStore();

  return (
    <aside className={styles.sidebar}>
      <div className={styles.searchBox}>
        <span className="material-icons search-icon">search</span>
        <Input
          placeholder="Поиск по названию"
          value={searchQuery}
          onChange={setSearchQuery}
        />
      </div>

      <h3 className={styles.filtersTitle}>Фильтры</h3>
      <div className={styles.filtersGrid}>
        {filters.map(filter => (
          <FilterItem key={filter.name} filter={filter} />
        ))}
      </div>

      <div className={styles.found}>
        Найдено: <span>{filteredOrgs.length}</span>
      </div>

      <div className={styles.orgList}>
        {filteredOrgs.map((org, index) => (
          <OrgCard key={index} org={org} />
        ))}
      </div>

      <Button variant="outline" className={styles.loadMore}>
        Загрузить ещё
      </Button>
    </aside>
  );
};