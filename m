Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4D24EB75
	for <lists+linux-tegra@lfdr.de>; Fri, 21 Jun 2019 17:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfFUPCN (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 21 Jun 2019 11:02:13 -0400
Received: from mail-wm1-f46.google.com ([209.85.128.46]:37606 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbfFUPCN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jun 2019 11:02:13 -0400
Received: by mail-wm1-f46.google.com with SMTP id f17so6951379wme.2
        for <linux-tegra@vger.kernel.org>; Fri, 21 Jun 2019 08:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Rd2PAyUJ2O5zWZ5mRDhrORHn7YMDVVllcAtfcYyO9Y=;
        b=qkzcw+DBg4F65GG5CBzhE2kFEXltIBBgro7lnujd5xnKoqmTFbNPF3FEjZ/Ysal7PI
         qzQoQl/Of3h8VHqP9mVvBYHk+mTHw/YCs5xV946af+ajYTquAgxCrEGPZCCYHmMIB8+u
         RsFi23UbPgbYqdnP6v6xUJiinrAvnCjVfFI3ZoZqWjN5bWge5Br0DQmoG975Qx7vgKEt
         SrHILEFZO1NyEpAGP2C1uCD+2NMyUJPzQMyi9W4vszvmjsPdNDDYmggT88WzjMz4ni+w
         Jnyzd85rAbjeIZ782eTkIrHnK8iLV85KSVLUwnn9WQANfSvX7GuZGQ+PwA+eCZsSkjUW
         mukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Rd2PAyUJ2O5zWZ5mRDhrORHn7YMDVVllcAtfcYyO9Y=;
        b=E52dmU8Mzn1mpCI2KauULtDan9J3ZTv/brU4I9QH3ZOvpr7dgmhfX09YnHQnDEPX4x
         7qGNguDFvrFUwSemKHfxvb2Gmd506F3EYYsrt5dWAoGFSwIUmF9auqU2S6v1xdfegd7R
         fKmBJfOgSpb+gtFt/E0yY9Eu6MerMDgiB2SipL2xwn5Xv2+5Ju+kou+wtpZEmpKo4GZb
         RbZpt4eOAZoTTZfvQbUmb+bYRW92xNOc+bP9min5jwcRHrVWjyA5sOI96R7TItzF5fJs
         AzyQlgg1b/ZJ9hk52butlPPHJitK/Z7X58eoHJ/VLhLjiM8bl9fdVuEirCL4on5bPM+T
         0Zzg==
X-Gm-Message-State: APjAAAUGC5XJAUeUOivoFMUQIWL2+BcKiwXp0c8zNXrh0JlxDVYC/7Rn
        BI3DvzK7H0c2fbFma6kP9h0=
X-Google-Smtp-Source: APXvYqy6vim3i1nwgqyIKgviYV8rTnVgZwhbzoejz/yJ01k8iOhM94+mPSfDJGXKzGYGQFh+Ez61RQ==
X-Received: by 2002:a05:600c:2182:: with SMTP id e2mr4428799wme.104.1561129331491;
        Fri, 21 Jun 2019 08:02:11 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id o6sm2913937wmc.15.2019.06.21.08.02.10
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 21 Jun 2019 08:02:11 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/5] soc: tegra: Changes for v5.3-rc1
Date:   Fri, 21 Jun 2019 17:02:04 +0200
Message-Id: <20190621150206.19037-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190621150206.19037-1-thierry.reding@gmail.com>
References: <20190621150206.19037-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.3-soc

for you to fetch changes up to 7ac13f6dcbd59b8f99395588cd7ef31f7e3bd3c6:

  soc/tegra: Select pinctrl for Tegra194 (2019-06-13 10:44:08 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc: tegra: Changes for v5.3-rc1

This contains a set of minor fixes and cleanups for core Tegra drivers.

----------------------------------------------------------------
Krishna Yarlagadda (1):
      soc/tegra: Select pinctrl for Tegra194

Thierry Reding (4):
      soc/tegra: pmc: Fail to allocate more than one wake IRQ
      soc/tegra: pmc: Avoid crash for non-wake IRQs
      soc/tegra: pmc: Add comments clarifying wake events
      soc/tegra: fuse: Do not log error message on deferred probe

 drivers/soc/tegra/Kconfig           |  1 +
 drivers/soc/tegra/fuse/fuse-tegra.c |  6 ++++--
 drivers/soc/tegra/pmc.c             | 18 ++++++++++++++++++
 3 files changed, 23 insertions(+), 2 deletions(-)
