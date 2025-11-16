import { create } from 'zustand';
import type {Organization} from '@/shared/lib/constants';

interface ModalState {
  isLoginOpen: boolean;
  isRegisterOpen: boolean;
  isCreatePointOpen: boolean;
  isOrgViewOpen: boolean;
  selectedOrg: Organization | null;
  openLogin: () => void;
  openRegister: () => void;
  openCreatePoint: () => void;
  openOrgView: (org: Organization) => void;
  closeAll: () => void;
}

export const useModalStore = create<ModalState>((set) => ({
  isLoginOpen: false,
  isRegisterOpen: false,
  isCreatePointOpen: false,
  isOrgViewOpen: false,
  selectedOrg: null,

  openLogin: () => set({
    isLoginOpen: true,
    isRegisterOpen: false,
    isCreatePointOpen: false,
    isOrgViewOpen: false
  }),

  openRegister: () => set({
    isLoginOpen: false,
    isRegisterOpen: true,
    isCreatePointOpen: false,
    isOrgViewOpen: false
  }),

  openCreatePoint: () => set({
    isLoginOpen: false,
    isRegisterOpen: false,
    isCreatePointOpen: true,
    isOrgViewOpen: false
  }),

  openOrgView: (org: Organization) => set({
    isLoginOpen: false,
    isRegisterOpen: false,
    isCreatePointOpen: false,
    isOrgViewOpen: true,
    selectedOrg: org
  }),

  closeAll: () => set({
    isLoginOpen: false,
    isRegisterOpen: false,
    isCreatePointOpen: false,
    isOrgViewOpen: false,
    selectedOrg: null
  })
}));