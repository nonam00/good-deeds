import { create } from 'zustand';
import {type Organization, type Filter, initialOrgs, filters } from '@/shared/lib/constants';

interface OrgsState {
  orgs: Organization[];
  filteredOrgs: Organization[];
  activeFilters: Set<string>;
  searchQuery: string;
  selectedCity: string;
  filters: Filter[];
  setSearchQuery: (query: string) => void;
  toggleFilter: (filterName: string) => void;
  setSelectedCity: (city: string) => void;
  applyFilters: () => void;
}

export const useOrgsStore = create<OrgsState>((set, get) => ({
  orgs: initialOrgs,
  filteredOrgs: initialOrgs,
  activeFilters: new Set(),
  searchQuery: '',
  selectedCity: '',
  filters: filters,

  setSearchQuery: (query: string) => {
    set({ searchQuery: query });
    get().applyFilters();
  },

  toggleFilter: (filterName: string) => {
    const { activeFilters } = get();
    const newFilters = new Set(activeFilters);

    if (newFilters.has(filterName)) {
      newFilters.delete(filterName);
    } else {
      newFilters.add(filterName);
    }

    set({ activeFilters: newFilters });
    get().applyFilters();
  },

  setSelectedCity: (city: string) => {
    set({ selectedCity: city });
  },

  applyFilters: () => {
    const { orgs, activeFilters, searchQuery } = get();
    let filtered = orgs;

    // Apply search
    if (searchQuery.trim()) {
      const q = searchQuery.trim().toLowerCase();
      filtered = filtered.filter(org =>
        org.name.toLowerCase().includes(q) ||
        org.address.toLowerCase().includes(q)
      );
    }

    // Apply filters
    if (activeFilters.size > 0) {
      filtered = filtered.filter(org =>
        Array.from(activeFilters).some(filter =>
          org.tags.map(t => t.toLowerCase()).includes(filter.toLowerCase())
        )
      );
    }

    set({ filteredOrgs: filtered });
  }
}));