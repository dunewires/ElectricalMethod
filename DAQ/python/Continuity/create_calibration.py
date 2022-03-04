import os
import sys
import shutil
import makeTxt4Cap
import CalibrationPickle

def create_structure():
    # Ensure script is run from expected directory
    cwd = os.getcwd()

    if cwd.find('ElectricalMethod/DAQ/python/Continuity') == -1:
        raise RuntimeError('Wrong current working directory, move to "ElectricalMethod/DAQ/python/Continuity" and run script again.')

    scan_top_folder = '../scanData'
    scan_parent_folders = os.listdir(scan_top_folder)

    ids_analog = []
    ids_flex = []

    key_prefix = 'APA_continuity'
    key_analog = '_Analog_'
    key_flex = '_Flex_'
    key_load = '_Load_'

    for folder in scan_parent_folders:
        if folder.find(key_prefix) != -1:
            index_analog = folder.find(key_analog)
            index_flex = folder.find(key_flex)
            index_load = folder.find(key_load)
            ids_analog.append(folder[index_analog+len(key_analog) : index_flex])
            ids_flex.append(folder[index_flex+len(key_flex) : index_load])
    ids_analog = list(set(ids_analog))
    ids_flex = list(set(ids_flex))

    dwa_folders = []
    # Loop over analog and flex cables for which continuity scans exist
    for id_analog in ids_analog:
        for id_flex in ids_flex:
                
            # Create folder specific to specified hardware
            dwa_folder = 'Analog_'+id_analog+'_Flex_'+id_flex
            dwa_folders.append(dwa_folder)
            continuity_scan_folder = dwa_folder+'/continuityScan'
            continuity_scan_folder_raw = continuity_scan_folder+'_raw'

            if os.path.exists(dwa_folder):
                print(f'Skipping creation of folder structure for hardware configuration {dwa_folder} as it already exists.')
                continue
            else:
                os.mkdir(dwa_folder)
                os.mkdir(continuity_scan_folder)
                os.mkdir(continuity_scan_folder_raw)

            capacitor_values = ['47', '100', '150', '220']
            sides = {'L': ['U1', 'U2', 'V17', 'V18', 'V33', 'V34', 'X17', 'X18' ], 'R': ['U17', 'U18', 'U33', 'U34', 'V1', 'V2', 'X1', 'X2', 'X33', 'X34']}
            for value in capacitor_values:
                # Get scans for each load board
                parent_folder = key_prefix + key_analog + id_analog + key_flex + id_flex + key_load + value
                scan_parent_folder = scan_top_folder+'/'+parent_folder
                shutil.copytree(scan_parent_folder, continuity_scan_folder_raw+'/'+parent_folder)

                scan_folders = os.listdir(scan_parent_folder)
                for folder in scan_folders:
                    # Skip hidden files
                    if(folder[0] == '.'):
                        continue

                    # Abbreviate using letter of layer and number of first wire
                    abbreviation = folder[0]+folder.split('_')[3].split('-')[0]
                    for side in sides:
                        # Create folder structure expected by continuity scripts
                        destination_folder = continuity_scan_folder+'/'+value+side
                        if not os.path.exists(destination_folder):
                            os.mkdir(destination_folder)
                        # Sort scans into new folders
                        if abbreviation in sides[side]:
                            destination_file = destination_folder+'/'+value+abbreviation+'.json'
                            if os.path.exists(destination_file):
                                print(f'Skipping creation of {destination_file} as it already exists.')
                                continue
                            shutil.copy2(scan_parent_folder+'/'+folder+'/'+'amplitudeData.json', destination_file)

    return dwa_folders


def main():
    print('Creating directory structure')
    dwa_folders = create_structure()

    for folder in dwa_folders:
        print(f'Creating pickle file for {folder}')
        makeTxt4Cap.main(folder+'/continuityScan')
        CalibrationPickle.main()

        # Move pickle file and remove temporary files
        pickle_name = 'fit.pickle'
        os.rename(pickle_name, folder+'/'+pickle_name)
        os.remove('extractFromJson.txt')
        os.remove('nameData.txt')
    print('All done.')

if __name__=='__main__':
    sys.exit(main())