Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 987EF184D1A
	for <lists+linux-tegra@lfdr.de>; Fri, 13 Mar 2020 17:59:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbgCMQ7J (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 13 Mar 2020 12:59:09 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52409 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgCMQ7J (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Mar 2020 12:59:09 -0400
Received: by mail-wm1-f66.google.com with SMTP id 11so10761541wmo.2
        for <linux-tegra@vger.kernel.org>; Fri, 13 Mar 2020 09:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h2OQdiDQUyrvmYwsp9KDl5pIL3uySvPG4HSk32vUtc4=;
        b=HL7RvJkiWgayVx4ZO0Odt4ufNPoBeKOpctl3GVTQuv+RkLYFHb303tunXwXsD1cIHF
         +GUk+Ts95jEqxeJafZACe1P/5SDjhcSDlfguyH4NRmuel5S1lHQgjByM7gjcFPY39Ebr
         XTafXc7GduXh9jLEJgdl3yDE1qsEoAfsK1nll8FVTeCKMvDxDVMUTUZb0CpwzJpIx8OP
         kgpluAIWYswh8PgXlaR6pU0cFnlJ01nC3egM3YaDo/Ui5D3tce/MVRk52zaV9bC0dtmU
         QHuMmgtePF3GVrT3AipYCF/0Tmhi6bRuLcqKGDoiu/l7HM4ul1bDWMPn2YOHBXRtkmRJ
         2+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h2OQdiDQUyrvmYwsp9KDl5pIL3uySvPG4HSk32vUtc4=;
        b=Z2kSzJErC5FgueYxoEGPXJSXiE7V5eehX5lfYCIDtBlXvpoIB+/0H/psSISOcQMHjc
         k1+MrQrzw1CxVLJoJPn2reUnJM3IODrheApSZu5kJKEaqv/DdrCWhcgyA2Eb0NFnHAPl
         WMFA8Ykt1gbLb3Un6dvHdQz73fOCsZK+SmLNTtZ2h1K0KCLa32QSZVRiSzJEWpBkgdQ5
         7GJdljbY30n7pOgtekW3ASeeAHj0ECYbtfKXnpeyWq9qqfJiYn/Gl/3aHoElHlgWtSTL
         57XY0IAUPXR4n2MB5unlpec9EQjN26MFJyDs/msLBQQ80jEnuJP+tnhfTJBrNRux1c60
         g/wQ==
X-Gm-Message-State: ANhLgQ0AJFllJdVT2azWTTVBDCo4Hor8J3+S4UfrMUxYsCDVKZghxkyW
        2TRYAcWOuSm/XBeAyS+F19I7nCn+
X-Google-Smtp-Source: ADFU+vsJq2xWDaC1gBfsaIiL8/spn18owTEhym4zjK0KOfvfRNeueTccAqgGVmLw62Bg4Yk58n9ghw==
X-Received: by 2002:a1c:e442:: with SMTP id b63mr12051308wmh.174.1584118747355;
        Fri, 13 Mar 2020 09:59:07 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id y143sm3076390wmd.12.2020.03.13.09.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 09:59:06 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 07/10] ARM: tegra: Default configuration changes for v5.7-rc1
Date:   Fri, 13 Mar 2020 17:58:45 +0100
Message-Id: <20200313165848.2915133-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200313165848.2915133-1-thierry.reding@gmail.com>
References: <20200313165848.2915133-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.7-arm-defconfig

for you to fetch changes up to 224c6632050481885368d5b7f3db56254a34c247:

  ARM: tegra: Enable Tegra cpuidle driver in tegra_defconfig (2020-03-12 11:05:00 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Default configuration changes for v5.7-rc1

These patches enable the new, unified CPU idle driver for Tegra20,
Tegra30 and Tegra114.

----------------------------------------------------------------
Dmitry Osipenko (2):
      ARM: multi_v7_defconfig: Enable Tegra cpuidle driver
      ARM: tegra: Enable Tegra cpuidle driver in tegra_defconfig

 arch/arm/configs/multi_v7_defconfig | 1 +
 arch/arm/configs/tegra_defconfig    | 1 +
 2 files changed, 2 insertions(+)
