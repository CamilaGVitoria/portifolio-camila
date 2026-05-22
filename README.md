> 🌎 **Choose your language:** [🇧🇷 Versão em Português](#-versão-em-português) | [🇺🇸 English Version](#-english-version)

---

## 🇧🇷 Versão em Português

# < Camila /> | Desenvolvedora Front-End

Acesse o projeto em produção: [camilagoncalvesvitoria.netlify.app](https://camilagoncalvesvitoria.netlify.app)

Este repositório contém o código-fonte do meu portfólio profissional desenvolvido com **Flutter Web**. A construção deste projeto foi guiada por princípios de Clean Code, componentização modular, responsividade fluida e otimização de renderização no ecossistema Dart.

O objetivo deste documento é detalhar as decisões técnicas e a arquitetura adotada na estruturação desta interface de página única (SPA).

### 🏛️ Arquitetura e Estrutura de Pastas

A aplicação foi estruturada seguindo o padrão de separação de responsabilidades no front-end, isolando a visualização principal, as seções lógicas da página e os componentes customizados reutilizáveis:

```text
lib/
 ┣ main.dart                # Inicialização do app e configuração do tema global
 ┣ views/
 ┃ ┗ home_view.dart         # Core da SPA, gerenciamento de estado e navegação
 ┣ sections/
 ┃ ┣ hero_section.dart      # Seção de apresentação e Call to Action
 ┃ ┣ about_section.dart     # Trajetória profissional, acadêmica e competências
 ┃ ┣ projects_section.dart  # Grid estandardizado de projetos e cards dinâmicos
 ┃ ┗ footer_section.dart    # Assinatura, informações de contato e redes
 ┗ widgets/
   ┗ animated_background.dart # Sistema interativo de partículas em CustomPaint
```
## 🇺🇸 English Version

# < Camila /> | Front-end Engineering

Access the live project: [camilagoncalvesvitoria.netlify.app](https://camilagoncalvesvitoria.netlify.app)

This repository contains the source code for my professional portfolio developed with **Flutter Web**. The construction of this project was guided by Clean Code principles, modular componentization, fluid responsiveness, and rendering optimization within the Dart ecosystem.

The purpose of this document is to detail the technical decisions and the architecture adopted in structuring this Single Page Application (SPA).

---

### 🏛️ Architecture and Folder Structure

The application was structured following the front-end separation of concerns pattern, isolating the main view, the logical page sections, and the reusable custom components:

```text
lib/
 ┣ main.dart                # App initialization and global theme configuration
 ┣ views/
 ┃ ┗ home_view.dart         # SPA core, state management, and navigation
 ┣ sections/
 ┃ ┣ hero_section.dart      # Presentation section and Call to Action
 ┃ ┣ about_section.dart     # Professional trajectory, academic background, and skills
 ┃ ┣ projects_section.dart  # Standardized project grid and dynamic cards
 ┃ ┗ footer_section.dart    # Signature, contact information, and social networks
 ┗ widgets/
   ┗ animated_background.dart # Interactive particle system using CustomPaint
```
