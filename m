Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B83016B54F
	for <lists+linux-tegra@lfdr.de>; Tue, 25 Feb 2020 00:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728646AbgBXXWS (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 24 Feb 2020 18:22:18 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42300 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728269AbgBXXWR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 Feb 2020 18:22:17 -0500
Received: by mail-lf1-f68.google.com with SMTP id 83so8107866lfh.9;
        Mon, 24 Feb 2020 15:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k6FLtN3q6kmojr5PEYweKUyu0r/NcpxTcs4nSZHU9t4=;
        b=VneMojm+Jn3SlSLwev39E+f0cnc8R8AG7D0AIp4LdDb/vK/cgYNZaczLe/naaczDmP
         KT8iujLPD0kbuIzJaEYLbAFkub5G33nuZ/OY4d1BHz201GFOAkxuQ0qPK5RNOBmGz/AH
         n7E0152inNJgW0V8eRmNjFXJLkh03tW9+nYVbFSX21J6kYXA/dtCozZVq+qCHYeSCT+F
         ume1YMd+an23MGmPWrHBe5+f05SbTHVihmb2PVMJ09M48iW/LoQt9bEVOmMLoUAzU1+K
         Geh/D5F2oVPBmasKXVcVqs95hEpaNJ1ym+ZDx725uJ+vh3Bh3h+8KEoZI9jytvWWioak
         wAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k6FLtN3q6kmojr5PEYweKUyu0r/NcpxTcs4nSZHU9t4=;
        b=qmbZChsHMOhrKS/BzRa5mrFFi/hhCUv8xCEpTEzgwFhE9DQXhHJrPGeSWHGskPapyn
         9/nmgKiqqMquBzMd78AxIGc7P0rnL08NvFMPUV6FclR9PE+Cz4quaD3FEXzzQkbi0ald
         GnSk5DUD4hRx5RqnKkdlSlBWHOHjwn6ULF7nud+xFrOnjiHRtDyaqE8tZE3pvezdgRVZ
         9YIMMsgwm7x6IHiWQfy9f7RUeqidaA5Uwe7/RjlpGYXwwQNSDt53+cHxF5rfzafHDFj6
         etPpivX/D0xKMMDYMyNFNpQlKq5dEoIyOwZG/NMw7ldzoD0JC3wUgZs3NRdPkPNi3YQe
         ArdQ==
X-Gm-Message-State: APjAAAVFmC2ltqEvvYmraZqBqujnyBI6wLlBwaCTS1eyBDWmbNylGycR
        d5A+6cqUaRCwlKtWJdjN2Tk=
X-Google-Smtp-Source: APXvYqwIYW7H1wonHt7qlsCojcF3BaCyul3dS5kI7zVRkGPj4a5DFcjnQ5ofawpjoqIObTTTHTFBYg==
X-Received: by 2002:a19:8c12:: with SMTP id o18mr6286314lfd.145.1582586534418;
        Mon, 24 Feb 2020 15:22:14 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id r10sm8154071ljk.9.2020.02.24.15.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 15:22:13 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Jens Axboe <axboe@kernel.dk>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        David Heidelberg <david@ixit.cz>,
        Peter Geis <pgwipeout@gmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Billy Laws <blaws05@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-block@vger.kernel.org,
        Andrey Danin <danindrey@mail.ru>,
        Gilles Grandou <gilles@grandou.net>,
        Ryan Grachek <ryan@edited.us>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] partitions: Introduce NVIDIA Tegra Partition Table
Date:   Tue, 25 Feb 2020 02:18:41 +0300
Message-Id: <20200224231841.26550-4-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200224231841.26550-1-digetx@gmail.com>
References: <20200224231841.26550-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

All NVIDIA Tegra devices use a special partition table format for the
internal storage partitioning. Most of Tegra devices have GPT partition
in addition to TegraPT, but some older Android consumer-grade devices do
not or GPT is placed in a wrong sector, and thus, the TegraPT is needed
in order to support these devices properly in the upstream kernel. This
patch adds support for NVIDIA Tegra Partition Table format that is used
at least by all NVIDIA Tegra20 and Tegra30 devices.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/tegra.c         |  35 +++
 block/partitions/Kconfig            |   8 +
 block/partitions/Makefile           |   1 +
 block/partitions/check.c            |   4 +
 block/partitions/tegra.c            | 373 ++++++++++++++++++++++++++++
 block/partitions/tegra.h            |  71 ++++++
 include/soc/tegra/bct.h             |  42 ++++
 include/soc/tegra/common.h          |   9 +
 include/soc/tegra/partition_table.h |  18 ++
 9 files changed, 561 insertions(+)
 create mode 100644 block/partitions/tegra.c
 create mode 100644 block/partitions/tegra.h
 create mode 100644 include/soc/tegra/bct.h
 create mode 100644 include/soc/tegra/partition_table.h

diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c
index e512e606eabd..22b584b1ecad 100644
--- a/arch/arm/mach-tegra/tegra.c
+++ b/arch/arm/mach-tegra/tegra.c
@@ -28,7 +28,9 @@
 
 #include <linux/firmware/trusted_foundations.h>
 
+#include <soc/tegra/bct.h>
 #include <soc/tegra/fuse.h>
+#include <soc/tegra/partition_table.h>
 #include <soc/tegra/pmc.h>
 
 #include <asm/firmware.h>
@@ -63,9 +65,42 @@ u32 tegra_uart_config[3] = {
 	0,
 };
 
+static void __init tegra_boot_config_table_init(void)
+{
+	void __iomem *bct_base;
+	u16 pt_addr, pt_size;
+
+	bct_base = IO_ADDRESS(TEGRA_IRAM_BASE) + TEGRA_IRAM_BCT_OFFSET;
+
+	if (of_machine_is_compatible("nvidia,tegra20")) {
+		struct tegra20_boot_config_table __iomem *t20_bct = bct_base;
+
+		if (t20_bct->boot_data_version != TEGRA_BOOTDATA_VERSION_T20)
+			return;
+
+		pt_addr = t20_bct->partition_table_logical_sector_address;
+		pt_size = t20_bct->partition_table_num_logical_sectors;
+	} else if (of_machine_is_compatible("nvidia,tegra30")) {
+		struct tegra30_boot_config_table __iomem *t30_bct = bct_base;
+
+		if (t30_bct->boot_data_version != TEGRA_BOOTDATA_VERSION_T30)
+			return;
+
+		pt_addr = t30_bct->partition_table_logical_sector_address;
+		pt_size = t30_bct->partition_table_num_logical_sectors;
+	} else {
+		return;
+	}
+
+	pr_info("%s: BCT found in IRAM\n", __func__);
+
+	tegra_partition_table_setup(pt_addr, pt_size);
+}
+
 static void __init tegra_init_early(void)
 {
 	of_register_trusted_foundations();
+	tegra_boot_config_table_init();
 	tegra_cpu_reset_handler_init();
 	call_firmware_op(l2x0_init);
 }
diff --git a/block/partitions/Kconfig b/block/partitions/Kconfig
index 702689a628f0..8e3b46ec528b 100644
--- a/block/partitions/Kconfig
+++ b/block/partitions/Kconfig
@@ -268,3 +268,11 @@ config CMDLINE_PARTITION
 	help
 	  Say Y here if you want to read the partition table from bootargs.
 	  The format for the command line is just like mtdparts.
+
+config TEGRA_PARTITION
+	bool "NVIDIA Tegra Partition support" if PARTITION_ADVANCED
+	depends on ARCH_TEGRA || COMPILE_TEST
+	select MMC_BLOCK
+	help
+	  Say Y here if you would like to be able to read the hard disk
+	  partition table format used by NVIDIA Tegra machines.
diff --git a/block/partitions/Makefile b/block/partitions/Makefile
index 2f276b677c81..807319883a18 100644
--- a/block/partitions/Makefile
+++ b/block/partitions/Makefile
@@ -21,3 +21,4 @@ obj-$(CONFIG_IBM_PARTITION) += ibm.o
 obj-$(CONFIG_EFI_PARTITION) += efi.o
 obj-$(CONFIG_KARMA_PARTITION) += karma.o
 obj-$(CONFIG_SYSV68_PARTITION) += sysv68.o
+obj-$(CONFIG_TEGRA_PARTITION) += tegra.o
diff --git a/block/partitions/check.c b/block/partitions/check.c
index ffe408fead0c..91268773b6ce 100644
--- a/block/partitions/check.c
+++ b/block/partitions/check.c
@@ -36,6 +36,7 @@
 #include "karma.h"
 #include "sysv68.h"
 #include "cmdline.h"
+#include "tegra.h"
 
 int warn_no_part = 1; /*This is ugly: should make genhd removable media aware*/
 
@@ -108,6 +109,9 @@ static int (*check_part[])(struct parsed_partitions *) = {
 #endif
 #ifdef CONFIG_SYSV68_PARTITION
 	sysv68_partition,
+#endif
+#ifdef CONFIG_TEGRA_PARTITION
+	tegra_partition,
 #endif
 	NULL
 };
diff --git a/block/partitions/tegra.c b/block/partitions/tegra.c
new file mode 100644
index 000000000000..fa517fa12c32
--- /dev/null
+++ b/block/partitions/tegra.c
@@ -0,0 +1,373 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * NVIDIA Tegra Partition Table
+ *
+ * Copyright (C) 2020 GRATE-DRIVER project
+ * Copyright (C) 2020 Dmitry Osipenko <digetx@gmail.com>
+ *
+ * Credits for the partition table format:
+ *
+ *   Andrey Danin <danindrey@mail.ru>       (Toshiba AC100 TegraPT format)
+ *   Gilles Grandou <gilles@grandou.net>    (Toshiba AC100 TegraPT format)
+ *   Ryan Grachek <ryan@edited.us>          (Google TV "Molly" TegraPT format)
+ *   Stephen Warren <swarren@wwwdotorg.org> (Useful suggestions about EMMC)
+ */
+
+#define pr_fmt(fmt) "tegra-partition: " fmt
+
+#include <linux/blkdev.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/sizes.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include <linux/mmc/card.h>
+#include <linux/mmc/host.h>
+
+#include <soc/tegra/common.h>
+#include <soc/tegra/partition_table.h>
+
+#include "check.h"
+#include "tegra.h"
+
+#define TEGRA_PT_SECTOR_SZ	(TEGRA_PT_LOGICAL_SECTOR_SIZE / SECTOR_SIZE)
+#define TEGRA_PT_SECTOR(s)	(TEGRA_PT_SECTOR_SZ * (s))
+
+#define TEGRA_PT_ERR(ptp, fmt, ...)					\
+	pr_err("%s: " fmt,						\
+		(ptp)->state->bdev->bd_disk->disk_name, ##__VA_ARGS__)
+
+#define TEGRA_PT_PARSE_ERR(ptp, fmt, ...)				\
+	TEGRA_PT_ERR(ptp, "sector %llu: invalid " fmt,			\
+		     (ptp)->sector, ##__VA_ARGS__)
+
+struct tegra_partition_table_parser {
+	struct tegra_partition_table *pt;
+	struct parsed_partitions *state;
+	sector_t sector;
+	int boot_offset;
+};
+
+union tegra_partition_table_u {
+	struct tegra_partition_table pt;
+	u8 pt_parts[TEGRA_PT_SECTOR_SZ][SECTOR_SIZE];
+};
+
+static sector_t tegra_pt_sector_address;
+static sector_t tegra_pt_sectors_num;
+
+/*
+ * Some partitions are very sensitive, changing data on them may brick device.
+ *
+ * For more details about partitions see:
+ *
+ *  "https://docs.nvidia.com/jetson/l4t/Tegra Linux Driver Package Development Guide/part_config.html"
+ */
+static const char * const partitions_blacklist[] = {
+	"BCT", "EBT", "GP1", "GPT", "MBR", "PT",
+};
+
+static bool tegra_partition_name_match(struct tegra_partition *p,
+				       const char *name)
+{
+	return !strncmp(p->partition_name, name, TEGRA_PT_NAME_SIZE);
+}
+
+static bool tegra_partition_skip(struct tegra_partition *p,
+				 struct tegra_partition_table_parser *ptp,
+				 sector_t sector)
+{
+	unsigned int i;
+
+	/* skip EMMC boot partitions */
+	if (sector < ptp->boot_offset)
+		return true;
+
+	for (i = 0; i < ARRAY_SIZE(partitions_blacklist); i++) {
+		if (tegra_partition_name_match(p, partitions_blacklist[i]))
+			return true;
+	}
+
+	return false;
+}
+
+static bool tegra_partition_valid(struct tegra_partition *p,
+				  struct tegra_partition *prev,
+				  struct tegra_partition_table_parser *ptp,
+				  sector_t sector,
+				  sector_t size)
+{
+	struct tegra_partition_info *prev_pi = &prev->part_info;
+	sector_t sect_end = TEGRA_PT_SECTOR(prev_pi->logical_sector_address +
+					    prev_pi->logical_sectors_num);
+	char *type, name[2][TEGRA_PT_NAME_SIZE + 1];
+
+	snprintf(name[0], TEGRA_PT_NAME_SIZE, "%s", p->partition_name);
+	snprintf(name[1], TEGRA_PT_NAME_SIZE, "%s", prev->partition_name);
+
+	/* validate partition table BCT addresses */
+	if (tegra_partition_name_match(p, "PT") &&
+	    sector != tegra_pt_sector_address &&
+	    size   != tegra_pt_sectors_num) {
+		TEGRA_PT_PARSE_ERR(ptp, "PT location: sector=%llu size=%llu\n",
+				   sector, size);
+		return false;
+	}
+
+	/* validate size overflow */
+	if (sector + size < sector) {
+		TEGRA_PT_PARSE_ERR(ptp, "size: [%s] integer overflow sector=%llu size=%llu\n",
+				   name[0], sector, size);
+		return false;
+	}
+
+	/* validate allocation_policy=sequential */
+	if (p != prev && sect_end > sector) {
+		TEGRA_PT_PARSE_ERR(ptp, "allocation_policy: [%s] end=%llu [%s] sector=%llu size=%llu\n",
+				   name[1], sect_end, name[0], sector, size);
+		return false;
+	}
+
+	sect_end = get_capacity(ptp->state->bdev->bd_disk);
+
+	/* EMMC boot partitions are below ptp->boot_offset */
+	if (sector < ptp->boot_offset) {
+		sect_end += ptp->boot_offset;
+		type = "boot";
+	} else {
+		sector -= ptp->boot_offset;
+		type = "main";
+	}
+
+	/* validate size */
+	if (!size || sector + size > sect_end) {
+		TEGRA_PT_PARSE_ERR(ptp, "size: [%s] %s partition boot_offt=%d end=%llu sector=%llu size=%llu\n",
+				   name[0], type, ptp->boot_offset, sect_end,
+				   sector, size);
+		return false;
+	}
+
+	return true;
+}
+
+static bool tegra_partitions_parse(struct tegra_partition_table_parser *ptp,
+				   bool check_only)
+{
+	struct parsed_partitions *state = ptp->state;
+	struct tegra_partition_table *pt = ptp->pt;
+	sector_t sector, size;
+	int i, slot = 1;
+
+	for (i = 0; i < pt->secure.num_partitions; i++) {
+		struct tegra_partition *p = &pt->partitions[i];
+		struct tegra_partition *prev = &pt->partitions[max(i - 1, 0)];
+		struct tegra_partition_info *pi = &p->part_info;
+
+		if (slot == state->limit && !check_only)
+			break;
+
+		sector = TEGRA_PT_SECTOR(pi->logical_sector_address);
+		size   = TEGRA_PT_SECTOR(pi->logical_sectors_num);
+
+		if (!tegra_partition_valid(p, prev, ptp, sector, size))
+			return false;
+
+		if (check_only ||
+		    tegra_partition_skip(p, ptp, sector))
+			continue;
+
+		put_partition(state, slot++, sector - ptp->boot_offset, size);
+	}
+
+	return true;
+}
+
+static bool
+tegra_partition_table_parsed(struct tegra_partition_table_parser *ptp)
+{
+	if (ptp->pt->secure.num_partitions == 0 ||
+	    ptp->pt->secure.num_partitions > TEGRA_PT_MAX_PARTITIONS) {
+		TEGRA_PT_PARSE_ERR(ptp, "num_partitions=%u\n",
+				   ptp->pt->secure.num_partitions);
+		return false;
+	}
+
+	return tegra_partitions_parse(ptp, true) &&
+	       tegra_partitions_parse(ptp, false);
+}
+
+static int
+tegra_partition_table_insec_hdr_valid(struct tegra_partition_table_parser *ptp)
+{
+	if (ptp->pt->insecure.magic   != TEGRA_PT_MAGIC ||
+	    ptp->pt->insecure.version != TEGRA_PT_VERSION) {
+		TEGRA_PT_PARSE_ERR(ptp, "insecure header: magic=0x%llx ver=0x%x\n",
+				   ptp->pt->insecure.magic,
+				   ptp->pt->insecure.version);
+		return 0;
+	}
+
+	return 1;
+}
+
+static int
+tegra_partition_table_sec_hdr_valid(struct tegra_partition_table_parser *ptp)
+{
+	if (ptp->pt->secure.magic   != TEGRA_PT_MAGIC ||
+	    ptp->pt->secure.version != TEGRA_PT_VERSION) {
+		TEGRA_PT_PARSE_ERR(ptp, "secure header: magic=0x%llx ver=0x%x\n",
+				   ptp->pt->secure.magic,
+				   ptp->pt->secure.version);
+		return 0;
+	}
+
+	return 1;
+}
+
+static int
+tegra_partition_table_unencrypted(struct tegra_partition_table_parser *ptp)
+{
+	/* AES IV, all zeros if unencrypted */
+	if (ptp->pt->secure.random_data[0] || ptp->pt->secure.random_data[1] ||
+	    ptp->pt->secure.random_data[2] || ptp->pt->secure.random_data[3]) {
+		pr_err_once("encrypted partition table unsupported\n");
+		return 0;
+	}
+
+	return 1;
+}
+
+static const struct of_device_id tegra_sdhci_match[] = {
+	{ .compatible = "nvidia,tegra20-sdhci", },
+	{ .compatible = "nvidia,tegra30-sdhci", },
+	{}
+};
+
+static int
+tegra_partition_table_emmc_boot_offset(struct tegra_partition_table_parser *ptp)
+{
+	struct mmc_card *card = mmc_bdev_to_card(ptp->state->bdev);
+
+	/* offset applies to the main built-in EMMC storage only */
+	if (!card || mmc_card_is_removable(card->host) ||
+	    !mmc_card_is_blockaddr(card))
+		return 0;
+
+	/* skip everything unrelated to Tegra's EMMC */
+	if (!of_match_node(tegra_sdhci_match, card->host->parent->of_node))
+		return -1;
+
+	/*
+	 * EMMC storage has two special boot partitions in addition to the
+	 * main one.  NVIDIA's bootloader linearizes EMMC boot0->boot1->main
+	 * accesses, this means that the partition table addresses are shifted
+	 * by the size of boot partitions.  In accordance with the EMMC
+	 * specification, the boot partition size is calculated as follows:
+	 *
+	 *	boot partition size = 128K byte x BOOT_SIZE_MULT
+	 *
+	 * This function returns number of sectors occupied by the both boot
+	 * partitions.
+	 */
+	return card->ext_csd.raw_boot_mult * SZ_128K /
+	       card->ext_csd.data_sector_size * MMC_NUM_BOOT_PARTITION;
+}
+
+static int tegra_read_partition_table(struct tegra_partition_table_parser *ptp)
+{
+	union tegra_partition_table_u *ptu = (typeof(ptu))ptp->pt;
+	unsigned int i;
+	Sector sect;
+	void *part;
+
+	for (i = 0; i < ARRAY_SIZE(ptu->pt_parts); i++) {
+		/*
+		 * Partition table takes at maximum 4096 bytes, but
+		 * read_part_sector() guarantees only that SECTOR_SIZE will
+		 * be read at minimum.
+		 */
+		part = read_part_sector(ptp->state, ptp->sector + i, &sect);
+		if (!part) {
+			TEGRA_PT_ERR(ptp, "failed to read sector %llu\n",
+				     ptp->sector + i);
+			return 0;
+		}
+
+		memcpy(ptu->pt_parts[i], part, SECTOR_SIZE);
+		put_dev_sector(sect);
+	}
+
+	return 1;
+}
+
+void tegra_partition_table_setup(sector_t logical_sector_address,
+				 sector_t logical_sectors_num)
+{
+	tegra_pt_sector_address = TEGRA_PT_SECTOR(logical_sector_address);
+	tegra_pt_sectors_num    = TEGRA_PT_SECTOR(logical_sectors_num);
+
+	pr_info("initialized to sector = %llu sectors_num = %llu\n",
+		tegra_pt_sector_address, tegra_pt_sectors_num);
+}
+
+int tegra_partition(struct parsed_partitions *state)
+{
+	struct tegra_partition_table_parser ptp = { .state = state };
+	sector_t sector_end;
+	int ret = 0;
+
+	if (!soc_is_tegra())
+		return 0;
+
+	ptp.boot_offset = tegra_partition_table_emmc_boot_offset(&ptp);
+	if (ptp.boot_offset < 0)
+		return 0;
+
+	if (tegra_pt_sector_address < ptp.boot_offset) {
+		pr_info("scanning EMMC boot partitions unimplemented\n");
+		return 0;
+	}
+
+	ptp.pt = kmalloc(sizeof(*ptp.pt), GFP_KERNEL);
+	if (!ptp.pt)
+		return 0;
+
+	ptp.sector = tegra_pt_sector_address - ptp.boot_offset;
+	sector_end = ptp.sector + tegra_pt_sectors_num;
+
+	/*
+	 * Partition table is duplicated till the sector_end.
+	 * If first table is corrupted, we will try next.
+	 */
+	while (ptp.sector < sector_end) {
+		ret = tegra_read_partition_table(&ptp);
+		if (!ret)
+			goto next_sector;
+
+		ret = tegra_partition_table_insec_hdr_valid(&ptp);
+		if (!ret)
+			goto next_sector;
+
+		ret = tegra_partition_table_unencrypted(&ptp);
+		if (!ret)
+			goto next_sector;
+
+		ret = tegra_partition_table_sec_hdr_valid(&ptp);
+		if (!ret)
+			goto next_sector;
+
+		ret = tegra_partition_table_parsed(&ptp);
+		if (ret)
+			break;
+next_sector:
+		ptp.sector += TEGRA_PT_SECTOR_SZ;
+	}
+
+	if (ret == 1)
+		strlcat(state->pp_buf, "\n", PAGE_SIZE);
+
+	kfree(ptp.pt);
+
+	return ret;
+}
diff --git a/block/partitions/tegra.h b/block/partitions/tegra.h
new file mode 100644
index 000000000000..c6173782dc2d
--- /dev/null
+++ b/block/partitions/tegra.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __FS_PART_TEGRA_H__
+#define __FS_PART_TEGRA_H__
+
+#include <linux/compiler.h>
+#include <linux/types.h>
+
+#define TEGRA_PT_MAGIC				0xffffffff8f9e8d8bULL
+#define TEGRA_PT_VERSION			0x100
+#define TEGRA_PT_LOGICAL_SECTOR_SIZE		4096
+#define TEGRA_PT_AES_HASH_SIZE			4
+#define TEGRA_PT_NAME_SIZE			4
+
+#define TEGRA_PT_HEADER_SZ						\
+	(sizeof(struct tegra_partition_header_insecure) +		\
+	 sizeof(struct tegra_partition_header_secure))			\
+
+#define TEGRA_PT_MAX_PARTITIONS						\
+	((TEGRA_PT_LOGICAL_SECTOR_SIZE - TEGRA_PT_HEADER_SZ) /		\
+	 sizeof(struct tegra_partition))
+
+struct tegra_partition_mount_info {
+	u32 device_id;
+	u32 device_instance;
+	u32 device_attr;
+	u8  mount_path[TEGRA_PT_NAME_SIZE];
+	u32 file_system_type;
+	u32 file_system_attr;
+} __packed;
+
+struct tegra_partition_info {
+	u32 partition_attr;
+	u32 __pad1;
+	u64 logical_sector_address;
+	u64 logical_sectors_num;
+	u64 __pad2[3];
+} __packed;
+
+struct tegra_partition {
+	u32 partition_id;
+	u8  partition_name[TEGRA_PT_NAME_SIZE];
+	struct tegra_partition_mount_info mount_info;
+	struct tegra_partition_info part_info;
+} __packed;
+
+struct tegra_partition_header_insecure {
+	u64 magic;
+	u32 version;
+	u32 length;
+	u32 signature[TEGRA_PT_AES_HASH_SIZE];
+} __packed;
+
+struct tegra_partition_header_secure {
+	u32 random_data[TEGRA_PT_AES_HASH_SIZE];
+	u64 magic;
+	u32 version;
+	u32 length;
+	u32 num_partitions;
+	u32 __pad;
+} __packed;
+
+struct tegra_partition_table {
+	struct tegra_partition_header_insecure insecure;
+	struct tegra_partition_header_secure secure;
+	struct tegra_partition partitions[TEGRA_PT_MAX_PARTITIONS];
+} __packed;
+
+int tegra_partition(struct parsed_partitions *state);
+
+#endif /* __FS_PART_TEGRA_H__ */
diff --git a/include/soc/tegra/bct.h b/include/soc/tegra/bct.h
new file mode 100644
index 000000000000..dc8547ab4b00
--- /dev/null
+++ b/include/soc/tegra/bct.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_TEGRA_BCT_H__
+#define __SOC_TEGRA_BCT_H__
+
+#include <linux/compiler.h>
+#include <linux/types.h>
+
+#define TEGRA_IRAM_BCT_OFFSET		0x100
+
+#define TEGRA_BOOTDATA_VERSION_T20	NVBOOT_BOOTDATA_VERSION(0x2, 0x1)
+#define TEGRA_BOOTDATA_VERSION_T30	NVBOOT_BOOTDATA_VERSION(0x3, 0x1)
+
+#define NVBOOT_BOOTDATA_VERSION(a, b)	((((a) & 0xffff) << 16) | \
+					  ((b) & 0xffff))
+#define NVBOOT_CMAC_AES_HASH_LENGTH	4
+
+struct tegra20_boot_config_table {
+	u32 crypto_hash[NVBOOT_CMAC_AES_HASH_LENGTH];
+	u32 random_aes_blk[NVBOOT_CMAC_AES_HASH_LENGTH];
+	u32 boot_data_version;
+	u32 unused_data1[712];
+	u32 unused_consumer_data1;
+	u16 partition_table_logical_sector_address;
+	u16 partition_table_num_logical_sectors;
+	u32 unused_consumer_data[292];
+	u32 unused_data[3];
+} __packed;
+
+struct tegra30_boot_config_table {
+	u32 crypto_hash[NVBOOT_CMAC_AES_HASH_LENGTH];
+	u32 random_aes_blk[NVBOOT_CMAC_AES_HASH_LENGTH];
+	u32 boot_data_version;
+	u32 unused_data1[1016];
+	u32 unused_consumer_data1;
+	u16 partition_table_logical_sector_address;
+	u16 partition_table_num_logical_sectors;
+	u32 unused_consumer_data[500];
+	u32 unused_data[3];
+} __packed;
+
+#endif /* __SOC_TEGRA_BCT_H__ */
diff --git a/include/soc/tegra/common.h b/include/soc/tegra/common.h
index 98027a76ce3d..744280ecab5f 100644
--- a/include/soc/tegra/common.h
+++ b/include/soc/tegra/common.h
@@ -6,6 +6,15 @@
 #ifndef __SOC_TEGRA_COMMON_H__
 #define __SOC_TEGRA_COMMON_H__
 
+#include <linux/types.h>
+
+#ifdef CONFIG_ARCH_TEGRA
 bool soc_is_tegra(void);
+#else
+static inline bool soc_is_tegra(void)
+{
+	return false;
+}
+#endif
 
 #endif /* __SOC_TEGRA_COMMON_H__ */
diff --git a/include/soc/tegra/partition_table.h b/include/soc/tegra/partition_table.h
new file mode 100644
index 000000000000..9a7cbc20dbff
--- /dev/null
+++ b/include/soc/tegra/partition_table.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_TEGRA_PARTITION_H__
+#define __SOC_TEGRA_PARTITION_H__
+
+#include <linux/types.h>
+
+#ifdef CONFIG_TEGRA_PARTITION
+void tegra_partition_table_setup(sector_t logical_sector_address,
+				 sector_t logical_sectors_num);
+#else
+static inline void tegra_partition_table_setup(sector_t logical_sector_address,
+					       sector_t logical_sectors_num)
+{
+}
+#endif
+
+#endif /* __SOC_TEGRA_PARTITION_H__ */
-- 
2.24.0

