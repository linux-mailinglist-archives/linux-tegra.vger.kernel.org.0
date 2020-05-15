Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFCD01D528E
	for <lists+linux-tegra@lfdr.de>; Fri, 15 May 2020 16:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726301AbgEOOxZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 15 May 2020 10:53:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726144AbgEOOxZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 May 2020 10:53:25 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 809B8C061A0C
        for <linux-tegra@vger.kernel.org>; Fri, 15 May 2020 07:53:24 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id u16so2978010wmc.5
        for <linux-tegra@vger.kernel.org>; Fri, 15 May 2020 07:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Pw1BFCuAKt6IQNELbv0mfDkndwTtb6MnbJ9W2vzOqk8=;
        b=j88BAb6+W1lKSXmFQXl8c8ubMS3HJmyFIEViI/wy03lMJqlwORgFwADDKCtR9I29kY
         NxYrRiAqaMrBPjeDqhnXilQi+GQ9m+QVgYpEQabTIWKc2JsTIoAu6ad12GNTl4YhtwEh
         b9aVBkkXQfxGxeOgPeB2M5xzx2ffUPxdDBA+jNMlKewh0cBElUn0pf2Mq7KwMRdOsr9n
         L/exgjIUDTRHSgDCmcSufnfYtySvzKEg64HdY/vEHkbdu5A0OxsCFne8EoZZex6pYzmq
         apMwLQfetctlpkoX5DFm7WKhh6L2NtSAT+P9xXXa3f+3HQzznRVo2ya448azLtJzGutj
         LH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pw1BFCuAKt6IQNELbv0mfDkndwTtb6MnbJ9W2vzOqk8=;
        b=amIThGA91sNnds92rhrJnqyt7EFMGFVoUXYXTC4PvYr1KNVgu4gA54BFI4qrWLJb6U
         y0OBCatWaIO0UnCQv5iBQHFnVfla1ganC1WBPDHTqG+6IHdG+FLvQlRbFpBrzAaIKU7q
         hEud4gYPbpxg2kbXMpA+ddjXqBRsqwpdfyPY6yg29NxVtwm0oBHCEukttA1t4GU+aWBe
         TNReiVrKOTojFQqPqjsBEumcD7WFZUC/S4aBQwSO51KrY4lsefZenO4hPpxdUpPMUVk6
         whEV6A0DJ1WvMxnK/woWT03P9OqlN10QS49yCwZcjFLK7gxk1RbT7HmOHhdIVpgyGuwH
         1fEw==
X-Gm-Message-State: AOAM530JJXYo797C62Ls9lvrpBJ2ruJPDGTMq47LrVyi/Rslrnv2/stR
        gOGH9+Uf3xabAdMWJ195iXySqF+x
X-Google-Smtp-Source: ABdhPJwz+aSEmb0e8zARPKSZaSp1zyqqh1haNvyTswk111Zze6kcNn8DlD6JxBkeQ8WX+I5xJ/O9BA==
X-Received: by 2002:a7b:cf14:: with SMTP id l20mr4599742wmg.100.1589554403259;
        Fri, 15 May 2020 07:53:23 -0700 (PDT)
Received: from localhost (pD9E51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id g6sm4015611wrp.75.2020.05.15.07.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:53:22 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 04/11] of: Changes for v5.8-rc1
Date:   Fri, 15 May 2020 16:53:04 +0200
Message-Id: <20200515145311.1580134-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200515145311.1580134-1-thierry.reding@gmail.com>
References: <20200515145311.1580134-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.8-of

for you to fetch changes up to 4a470f00e10e3336350ab60ec6c3206177093019:

  of: Make <linux/of_reserved_mem.h> self-contained (2020-05-12 22:45:39 +0200)

Thanks,
Thierry

----------------------------------------------------------------
of: Changes for v5.8-rc1

These changes add support for multiple reserved-memory regions per
device.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      of: Make <linux/of_reserved_mem.h> self-contained

Thierry Reding (2):
      of: reserved-memory: Support lookup of regions by name
      of: reserved-memory: Support multiple regions per device

 drivers/of/of_reserved_mem.c    | 41 +++++++++++++++++++++++++++++------------
 include/linux/of_reserved_mem.h | 12 ++++++++++++
 2 files changed, 41 insertions(+), 12 deletions(-)
