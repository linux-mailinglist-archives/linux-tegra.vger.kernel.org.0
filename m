Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E99B7184D16
	for <lists+linux-tegra@lfdr.de>; Fri, 13 Mar 2020 17:59:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgCMQ7B (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 13 Mar 2020 12:59:01 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:32974 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgCMQ7B (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Mar 2020 12:59:01 -0400
Received: by mail-wr1-f68.google.com with SMTP id a25so13038691wrd.0
        for <linux-tegra@vger.kernel.org>; Fri, 13 Mar 2020 09:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u2Z5UcmV8/VofLHm97f5YbQrhljIP7Kqx9/wdHClbo8=;
        b=shqhanNgu6CUiTgvC+fvofwKds2aVa+PN19WE7YVRO19OdXXPLw11iLUCyIKLn7itd
         PiimYJXj2aD8ItxRT9DOHBprZeBQdfSBW6s8Plb2vddcEiKrRCHfXusAKyBQKaz4S72P
         8TRl+vcBCuejzM+joA5ukgGmRL4aIvGEdyMlRbw5PAhnyKD/b2NzBG4n+r8xpxcuP/7g
         a8R++LDuJjMF3+qqeh/433eu5RZfTvv0OrZDxgGRXsiaabzgNgoreU/VTkaRGOB/TFOF
         RW9G8rOj63kLO1HmNcYCJj2OI88jsNdhyPcHTvzAmi/oGbZdkyykrurwnFRWxknIcujE
         bcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u2Z5UcmV8/VofLHm97f5YbQrhljIP7Kqx9/wdHClbo8=;
        b=FIEgF93t4GPjkmY7ceseDEx35ASYOlxw2VlHzePwvPC3q/GWu5pL0nv/msFHUfsuEt
         OoSB6kk7r5hRXevpBV735GaFcw2IMEh4fDGTE0fiCYbjedHyTooROe2xyDmK9P+KRRMh
         Z88Ec9H3VJ6dhUbivOgWbBv6ytP8dU7YYeK9Y9HUoQdjSvrNvDHQ/mH9YdW6dQo+sH4F
         WHXTD8y3z+8tCDv4MpFUUu91Lbs/sEOUQ72UbcAV1ft4lrCF7i+YwGcg/75Bg8JmOpL5
         mokRgRZibwpktVE3D1xGiWEVbxZwP0qiCvrYmMTpGxYDI9nucS6PZ1SAX2wOHdpmFRK9
         BxMg==
X-Gm-Message-State: ANhLgQ2utpPi5ccO/p7HdSXMWANeXUALdwQSpPkZw58UPsnPIQEX4zYV
        dHrUbj5FHMKAt/VA3kT4+js=
X-Google-Smtp-Source: ADFU+vuH7CkP7rWK/tMMl7um+/dktR/3uTHUtNvgvBKom1Y+98hD6NSEKua1SljTWsm5xTR7l2vPog==
X-Received: by 2002:adf:a555:: with SMTP id j21mr19040106wrb.409.1584118739503;
        Fri, 13 Mar 2020 09:58:59 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id s28sm4995825wrb.42.2020.03.13.09.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 09:58:58 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 03/10] soc/tegra: Changes for v5.7-rc1
Date:   Fri, 13 Mar 2020 17:58:41 +0100
Message-Id: <20200313165848.2915133-3-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.7-soc

for you to fetch changes up to 4825f5354ef2e3f6bce61d0ed652a23daf379f8e:

  soc/tegra: pmc: Cleanup whitespace usage (2020-03-13 10:53:10 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.7-rc1

These changes implement various clocks that are controlled by the PMC
and add support for configuring the voltage level of some pins (needed
for example to support high-speed modes on the SD/MMC interfaces).

----------------------------------------------------------------
JC Kuo (1):
      dt-bindings: phy: tegra: Add Tegra194 support

Nagarjuna Kristam (2):
      dt-bindings: phy: tegra-xusb: Add usb-role-switch
      dt-bindings: usb: Add NVIDIA Tegra XUSB device mode controller binding

Sowjanya Komatineni (6):
      dt-bindings: clock: tegra: Add IDs for OSC clocks
      dt-bindings: tegra: Convert Tegra PMC bindings to YAML
      dt-bindings: soc: tegra-pmc: Add Tegra PMC clock bindings
      dt-bindings: soc: tegra-pmc: Add ID for Tegra PMC 32 kHz blink clock
      soc/tegra: Add Tegra PMC clocks registration into PMC driver
      soc/tegra: Add support for 32 kHz blink clock

Thierry Reding (2):
      Merge branch 'for-5.7/dt-bindings' into for-5.7/soc
      soc/tegra: pmc: Cleanup whitespace usage

Venkat Reddy Talla (1):
      soc/tegra: pmc: Add pins for Tegra194

 .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      | 300 ---------
 .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml     | 354 +++++++++++
 .../bindings/phy/nvidia,tegra124-xusb-padctl.txt   |  24 +
 .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml | 190 ++++++
 drivers/soc/tegra/pmc.c                            | 688 ++++++++++++++++-----
 include/dt-bindings/clock/tegra114-car.h           |   4 +-
 include/dt-bindings/clock/tegra124-car-common.h    |   4 +-
 include/dt-bindings/clock/tegra210-car.h           |   4 +-
 include/dt-bindings/clock/tegra30-car.h            |   4 +-
 include/dt-bindings/soc/tegra-pmc.h                |  16 +
 include/soc/tegra/pmc.h                            |   3 +-
 11 files changed, 1125 insertions(+), 466 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
 create mode 100644 include/dt-bindings/soc/tegra-pmc.h
