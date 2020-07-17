Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B930922405D
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Jul 2020 18:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbgGQQNL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Jul 2020 12:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbgGQQNL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Jul 2020 12:13:11 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE6C6C0619D2
        for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2020 09:13:10 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id n22so8507980ejy.3
        for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2020 09:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PyluBXymQd9koc0TxAITWIkpAPHeh+RdSix+euQxXpI=;
        b=kaO015xgG4syCk1jk3GWZ0n/RQ1WBFteVC4S/fATiEbsKcTTXRJRq7OR9od2pAEJky
         Kch/YdmyaRC1SrmzQWohbI5TZqMgXjoY4IB3dJX2nkzW8jRIg8HEoeCjROXILurgCCNN
         mQoKReblgSTMsiGlBfP45yhJ9oEW9J9Mkiwo+hmi0FgvGTtqV7Fp5wDZiuRBfy9UEdu+
         RAHtIIqohyRXMA7ZkMn6wmQwrUC3kXz4i9u+lj+2hbmYodZNHQXqwXOX/IL1L/leQg/O
         gf/4faHDPxnt9hkF4NYW9vCPexJHSoUwH839lvFyYK/hZw55xp/z4YSVnB4QkT+zpdv3
         KNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PyluBXymQd9koc0TxAITWIkpAPHeh+RdSix+euQxXpI=;
        b=M9qwDxTk+Mr2pM7tQpT/wKScUvyh5GKS7vEJijSJyIKmHwcKdJlGCvv/tg4tGzH1f9
         NwQOC3Cof5NK+CDTNxosIxgb3uhm9+5CrLeDSRc51q/pcCjADCd4Ew4MbBU90TCspHYl
         LHOxxb//wiLxqp9QVQ4ToLIYHTjss4P3pfGaSFAOlih5xCeKZILWvODPMMLjQtaiZWSc
         xomLDin+VB7Ptl/z9xuUiAbS35jM28Ottgep/pbjXz7159f4r8QUnZyLKsQ5TdpSOp6D
         645LWIGGdWm8Do1z9cmiUjG1fdi1B2D3VgQ7a8qZ0hyEszWQIZ00cA9uf8/1S0HRNtKz
         vTKA==
X-Gm-Message-State: AOAM5319fe02NF1GxOZ9y2XrEjQdMH7LpgBXeTiYpHsHtHDgk3Xo8SL+
        zD5iVqPaOgUb514T6sZn7ds=
X-Google-Smtp-Source: ABdhPJwszd8M3mXfjh1BUsR8iEm9LF0t6+sLTXD7J6C8dnsjWanLBKRU603jfSwE0B7GXhpIMYE3sQ==
X-Received: by 2002:a17:906:5e0b:: with SMTP id n11mr9473356eju.15.1595002389674;
        Fri, 17 Jul 2020 09:13:09 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id bw7sm8482283ejb.5.2020.07.17.09.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 09:13:08 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/7] soc/tegra: Changes for v5.9-rc1
Date:   Fri, 17 Jul 2020 18:12:57 +0200
Message-Id: <20200717161300.1661002-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717161300.1661002-1-thierry.reding@gmail.com>
References: <20200717161300.1661002-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.9-soc

for you to fetch changes up to eb8bb7abbb0b22238b844578970f14fa982fc2b0:

  soc/tegra: fuse: Fix typo in APB MISC warning (2020-07-17 15:47:35 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.9-rc1

This adds missing SoC IDs for Tegra186 and Tegra194 and fixes a typo in
a warning message.

----------------------------------------------------------------
Sandipan Patra (1):
      soc/tegra: fuse: Add Tegra186 and Tegra194 SoC IDs

Thierry Reding (1):
      soc/tegra: fuse: Fix typo in APB MISC warning

 drivers/soc/tegra/fuse/tegra-apbmisc.c | 2 +-
 include/soc/tegra/fuse.h               | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)
