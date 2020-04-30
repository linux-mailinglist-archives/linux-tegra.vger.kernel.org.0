Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8598D1BF5F5
	for <lists+linux-tegra@lfdr.de>; Thu, 30 Apr 2020 12:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbgD3K5E (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 30 Apr 2020 06:57:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725280AbgD3K5E (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Apr 2020 06:57:04 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12CEFC035494
        for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2020 03:57:04 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id v4so7155432wme.1
        for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2020 03:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jj6p2YpGSox3F15VSPbCYzWaJapP8E+/lKOnhUtxGBg=;
        b=LUMFbITFgmqAo0AtnoUs45u4+OcNpVql+lKmRWk2CFIWLFQ6T3xwgRclZrxrLTdJ8z
         jynNNktDayZJy4oKN4h4lkRpNkTS3Ll67lqKW4o2cmSXxaVKUACOD6SIjoaIcszARLbB
         yJgck2Ak1LdV1IMcMLqusVbaZUpgJgue2Bulwz9xnbID+sgCT7+exnyBzYUk9oQbQoZS
         rdxwAofZ/dbalQm51Lr8AUFEW1QX/jukCxiHaRGt4jhkiY/kw9C+968eXUcx+9KRT27m
         xT7Z1T8x0HM+WpZ04VIZvw4fy5Jt97BCgvso14FXWpwoP3LnwEfNv6CxpT05BW2YSjpm
         Tyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jj6p2YpGSox3F15VSPbCYzWaJapP8E+/lKOnhUtxGBg=;
        b=udwwjZN/w3xpgnMP1gbjZBkrdksV/P+rxh8Yy5FB2MYi062d2BEVsT6CboRQep9qWV
         8JwEmGTml/1Y7gx/p74giazoJ5IpT/88iixwGOQoXv8ZtxGb2q51Z1DfQFEO0wuyRmv9
         JBzYatj/7PAjDHg9byCRSlgpJQGxBS1QxKdmSeHR0hBJ4JCt6l9kJp0q7t5HgftzSH+o
         hWUN+/KqJHOuWU7owdS9Fl+rsZ7jXm+vKlKFkyiszWqggW1RaLUxwI/OHIkIBc/DjLop
         3bihYAEuPzmg4W+w7VdmZIJrdwAhrUUIEaR0OUPoSq2Wz5XvmDa8avc8fpGChxnJl8VZ
         437w==
X-Gm-Message-State: AGi0PuZKWbN9yKX+WJw0qmzD3Yx3UhjQ4W+PS9UZO1qTXRgZaPozxKyq
        YfT4AxDZtSmpkzZfrh0sDQklFrV6
X-Google-Smtp-Source: APiQypKo3oFe1Z9aVVCTHSaI/PaiQaBTQuve9rAqMg95GfgHRhWtxPBWxkavkHBuzpNxXqbKDzc+NA==
X-Received: by 2002:a1c:8049:: with SMTP id b70mr2365240wmd.162.1588244222709;
        Thu, 30 Apr 2020 03:57:02 -0700 (PDT)
Received: from localhost (p2E5BEDBA.dip0.t-ipconnect.de. [46.91.237.186])
        by smtp.gmail.com with ESMTPSA id c1sm3563459wrc.4.2020.04.30.03.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 03:57:01 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: tegra: Default configuration fixes for v5.7-rc4
Date:   Thu, 30 Apr 2020 12:57:00 +0200
Message-Id: <20200430105700.167199-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.7-arm64-defconfig-fixes

for you to fetch changes up to 90670f0ef690f9c8712f236e8cf14c156c9a6365:

  arm64: defconfig: Re-enable Tegra PCIe host driver (2020-04-14 16:15:00 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration fixes

This contains a single fix to reenable the Tegra194 PCIe host support by
default that was inadvertently dropped as a result of the host/endpoint
mode support that was added in v5.7-rc1.

----------------------------------------------------------------
Jon Hunter (1):
      arm64: defconfig: Re-enable Tegra PCIe host driver

 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
