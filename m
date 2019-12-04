Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01D4D112C4B
	for <lists+linux-tegra@lfdr.de>; Wed,  4 Dec 2019 14:08:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727503AbfLDNIA (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 4 Dec 2019 08:08:00 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35321 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbfLDNIA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 Dec 2019 08:08:00 -0500
Received: by mail-wm1-f66.google.com with SMTP id u8so7869880wmu.0
        for <linux-tegra@vger.kernel.org>; Wed, 04 Dec 2019 05:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0/7wINVtMbJmgnch69y8oJMBPMSuQVXES+Foib2NSNQ=;
        b=jy4ATzWV2ZqdCLxvh3qRv0G5MCsHyjSmAOH9dhWBl8KMm9uz90vytmJCdpsCSMRs3B
         lMpNeWRiDSkunQIRty4fm/TvKbC4Jv9U6hWJRqEb8OWkASkKEtzkppf6ix7hblGpojBV
         coZ3i3q9m2RKNJo+pPnOs3fqSc8snROOry1Z2+m/Wsbn8wsHj+vHCtgSn2fOLpen2z7A
         GkTLiseXl+gxlUK6sLePAeBWgOKuBa6qoFWu6hoIFoDSKF4ekml0KG0KHm5NoWTwPs9X
         Uk9koKPPljPFNjEbj2sIf4O/0uGimgGbw3T0HREYEfUTQJ1AYnUKSvQDAmourP80mN0e
         rGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0/7wINVtMbJmgnch69y8oJMBPMSuQVXES+Foib2NSNQ=;
        b=P0dkEfSzobhZrCFeuaew37zP2SsTJQyLIgeH3bvRMQK9vr1ZABf70IKA/L0M437S+9
         uQncktM3o8v4DxXNO0jlv7b8bembkMQQh68qgPsuDzs7Y3RlhV8VqRcrsLrq57GhoC25
         wpJAk5X+teSO26PkItnhrHhsqv1ZftG6VrYlYZj61fU8Pn1k+Y20Gk1C8AftksdrH3Wn
         5N0NZ7wOp6ow5bSudgFmj0w5dpDhCyoAyJhLdAHcUtniG94QIUhjXP77iCOrWgY3V0vc
         pr2O3wZCo6/MiSxrPFxV6aVDiwfyb4wm/Q/adr8dpo1woVnvJ6g5CMdec25gpAOrHCuO
         OQuQ==
X-Gm-Message-State: APjAAAUbqREQiW0HILk/H34ic94p/ykIRy4ftjdQc8tfs94VPUlLEe0t
        fU7UQ5xvOWmQBVytiSQHKsE=
X-Google-Smtp-Source: APXvYqzG0LHuLoU/8RkwQDogdyzeWoOEDNJbv+/o466Pvkk/2jIrrUi+5F/MExEMuYHU3Eq7+34Ykg==
X-Received: by 2002:a7b:c318:: with SMTP id k24mr26898055wmj.54.1575464878274;
        Wed, 04 Dec 2019 05:07:58 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id b17sm8211485wrx.15.2019.12.04.05.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 05:07:57 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     soc@kernel.org, arm@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/3] soc/tegra: Fixes for v5.5-rc1
Date:   Wed,  4 Dec 2019 14:07:52 +0100
Message-Id: <20191204130753.3614278-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191204130753.3614278-1-thierry.reding@gmail.com>
References: <20191204130753.3614278-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 69dfb3d4a89afccca1d8f282e49ad1362100cc43:

  soc/tegra: pmc: Remove unnecessary memory barrier (2019-10-29 14:36:24 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-soc-fixes

for you to fetch changes up to 48914c4ecb0c0fa1d70ea7b97d758ce5fadacfb0:

  soc/tegra: pmc: Add reset sources and levels on Tegra194 (2019-11-18 13:56:58 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Fixes for v5.5-rc1

Fixes a regression for wake events on Tegra194 caused by the Tegra210
support that was added in v5.5-rc1 as well as wrong reset sources and
levels on Tegra194.

----------------------------------------------------------------
Thierry Reding (3):
      soc/tegra: pmc: Use lower-case for hexadecimal literals
      soc/tegra: pmc: Add missing IRQ callbacks on Tegra194
      soc/tegra: pmc: Add reset sources and levels on Tegra194

 drivers/soc/tegra/pmc.c | 47 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)
